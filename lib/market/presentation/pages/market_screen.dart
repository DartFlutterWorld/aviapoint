import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
import 'package:aviapoint/market/presentation/widgets/parts_market_card.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MarketScreen extends StatefulWidget {
  final int? initialTab; // 0 для авиатехники, 1 для запчастей

  const MarketScreen({super.key, this.initialTab});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;
  final ScrollController _scrollController = ScrollController();

  String _currentProductType = 'aircraft'; // 'aircraft' или 'parts'

  /// Выбранные категории (типы самолётов)
  /// - Пустой список = выбраны все (фильтр по типу не применяется)
  /// - Можно выбрать несколько категорий
  /// - Повторное нажатие по выбранной категории снимает выбор
  List<int> _selectedCategoryIds = [];
  int? _priceFrom;
  int? _priceTo;
  String? _brand;
  String _sortBy = 'default';

  @override
  void initState() {
    super.initState();
    // Устанавливаем начальную вкладку из параметра (0 = авиатехника, 1 = запчасти)
    final initialIndex = widget.initialTab ?? 0;
    _tabController = TabController(length: 2, vsync: this, initialIndex: initialIndex);
    _tabController.addListener(_onTabChanged);
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);

    // Устанавливаем текущий тип продукта в зависимости от начальной вкладки
    _currentProductType = initialIndex == 0 ? 'aircraft' : 'parts';

    // Загружаем начальные данные (категории)
    _loadInitialData();

    // После построения экрана применяем фильтры для текущей вкладки.
    // Это сбрасывает лимит 2, который используется на главной, на стандартный лимит пагинации,
    // но НЕ грузит все товары сразу — только первую страницу.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyFilters();
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: _currentProductType));
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;

    // Только обновляем состояние, без перезагрузки категорий
    setState(() {
      _currentProductType = _tabController.index == 0 ? 'aircraft' : 'parts';
      _selectedCategoryIds = [];
    });

    // Загружаем категории только если они еще не загружены для этого типа
    final categoriesState = context.read<MarketCategoriesBloc>().state;
    categoriesState.maybeWhen(
      success: (categories) {
        // Проверяем, есть ли категории для текущего типа продукта
        final hasCategoriesForType = categories.any((cat) => cat.productType == _currentProductType);
        if (!hasCategoriesForType) {
          context.read<MarketCategoriesBloc>().add(
            MarketCategoriesEvent.getMainCategories(productType: _currentProductType),
          );
        }
      },
      orElse: () {
        context.read<MarketCategoriesBloc>().add(
          MarketCategoriesEvent.getMainCategories(productType: _currentProductType),
        );
      },
    );

    // Обновляем список для новой вкладки с текущими фильтрами/поиском
    _applyFilters();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      if (_currentProductType == 'aircraft') {
        final state = context.read<AircraftMarketBloc>().state;
        state.maybeWhen(
          success: (products, hasMore) {
            if (hasMore) {
              context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.loadMore());
            }
          },
          orElse: () {},
        );
      } else {
        final state = context.read<PartsMarketBloc>().state;
        state.when(
          loading: () {},
          loadingMore: (List<PartsMarketEntity> parts) {},
          error:
              (
                String? errorFromApi,
                String errorForUser,
                String? statusCode,
                StackTrace? stackTrace,
                String? responseMessage,
              ) {},
          success: (List<PartsMarketEntity> parts, bool hasMore) {
            if (hasMore) {
              context.read<PartsMarketBloc>().add(const PartsMarketEvent.loadMore());
            }
          },
          creatingPart: () {},
          createdPart: (PartsMarketEntity part) {},
          updating: () {},
          updated: (PartsMarketEntity part) {},
        );
      }
    }
  }

  void _onSearchChanged() {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      _applyFilters();
    });
  }

  void _applyFilters() {
    final searchQuery = _searchController.text.trim().isEmpty ? null : _searchController.text.trim();

    if (_currentProductType == 'aircraft') {
      // Если выбрана одна категория – передаём её как одиночный id (для обратной совместимости).
      // Если выбрано несколько – используем только список ids, чтобы на бэкенде фильтр был по нескольким категориям.
      final int? singleCategoryId = _selectedCategoryIds.length == 1 ? _selectedCategoryIds.first : null;

      context.read<AircraftMarketBloc>().add(
        AircraftMarketEvent.getProducts(
          aircraftSubcategoriesId: singleCategoryId,
          aircraftSubcategoriesIds: _selectedCategoryIds.isNotEmpty ? _selectedCategoryIds : null,
          searchQuery: searchQuery,
          priceFrom: _priceFrom,
          priceTo: _priceTo,
          brand: _brand,
          sortBy: _sortBy,
        ),
      );
    } else {
      // Для запчастей
      final int? singleCategoryId = _selectedCategoryIds.length == 1 ? _selectedCategoryIds.first : null;

      context.read<PartsMarketBloc>().add(
        PartsMarketEvent.getParts(
          subcategoryId: singleCategoryId,
          mainCategoryId: _selectedCategoryIds.isNotEmpty && _selectedCategoryIds.length > 1
              ? null
              : null, // TODO: нужно будет доработать логику для main category
          searchQuery: searchQuery,
          priceFrom: _priceFrom,
          priceTo: _priceTo,
          sortBy: _sortBy,
        ),
      );
    }
  }

  Future<void> _handleCreateAdButtonTap(BuildContext context) async {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    if (!isAuthenticated) {
      // Если не авторизован, показываем экран авторизации
      await showLogin(
        context,
        callback: () {
          // После успешной авторизации переходим на создание объявления
          if (mounted) {
            if (_currentProductType == 'aircraft') {
              context.router.push(const CreateAircraftMarketRoute());
            } else {
              context.router.push(const CreatePartsMarketRoute());
            }
          }
        },
      );
    } else {
      // Если авторизован, сразу переходим на создание объявления
      if (_currentProductType == 'aircraft') {
        context.router.push(const CreateAircraftMarketRoute());
      } else {
        context.router.push(const CreatePartsMarketRoute());
      }
    }
  }

  void _showFiltersDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => _FiltersDialog(
        productType: _currentProductType,
        priceFrom: _priceFrom,
        priceTo: _priceTo,
        brand: _brand,
        sortBy: _sortBy,
      ),
    );

    if (result != null) {
      setState(() {
        _priceFrom = result['priceFrom'];
        _priceTo = result['priceTo'];
        _brand = result['brand'];
        _sortBy = result['sortBy'] ?? 'default';
      });
      _applyFilters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PartsMarketBloc, PartsMarketState>(
          listenWhen: (previous, current) {
            // Слушаем когда создание или обновление завершилось успешно
            return (previous is CreatingPartsMarketState && current is CreatedPartsMarketState) ||
                (previous is UpdatingPartsMarketState && current is UpdatedPartsMarketState);
          },
          listener: (context, state) {
            state.maybeWhen(
              createdPart: (part) {
                // Обновляем список после успешного создания
                // Используем небольшую задержку, чтобы экран создания успел закрыться
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (context.mounted) {
                    context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  }
                });
              },
              updated: (part) {
                // Обновляем список после успешного обновления
                // Используем небольшую задержку, чтобы экран редактирования успел закрыться
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (context.mounted) {
                    context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  }
                });
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: FloatingActionButtonWidget(
          title: 'Создать\nобъявление',
          onTap: () => _handleCreateAdButtonTap(context),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                snap: false,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.backgroundAppBar,
                elevation: 1,
                shadowColor: const Color(0xFFA8A39C).withValues(alpha: 0.12),
                leadingWidth: 60,
                centerTitle: true,
                title: Text(
                  'Маркет',
                  style: AppStyles.bold16s.copyWith(color: const Color(0xFF223B76), fontFamily: 'Geologica-Medium'),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [if (Provider.of<AppState>(context, listen: false).isAuthenticated) _MarketProfileButton()],
                bottom: TabBar(
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  labelColor: const Color(0xFF0A6EFA),
                  unselectedLabelColor: const Color(0xFF9CA5AF),
                  dividerColor: Colors.transparent,
                  // Чуть меньше шрифт, чтобы визуально уменьшить высоту таббара
                  labelStyle: AppStyles.bold12s,
                  unselectedLabelStyle: AppStyles.regular12s,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.5, color: Color(0xFF0A6EFA)),
                    // Подчёркивание максимально близко к тексту
                    insets: EdgeInsets.zero,
                  ),
                  labelPadding: EdgeInsets.zero,
                  tabs: const [
                    Tab(text: 'Авиатехника'),
                    Tab(text: 'Запчасти'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _MarketContent(
                productType: 'aircraft',
                searchController: _searchController,
                selectedCategoryIds: _selectedCategoryIds,
                onCategorySelected: (MarketCategoryEntity category) {
                  setState(() {
                    if (_selectedCategoryIds.contains(category.id)) {
                      _selectedCategoryIds.remove(category.id);
                    } else {
                      _selectedCategoryIds.add(category.id);
                    }
                  });
                  _applyFilters();
                },
                onFiltersDialog: _showFiltersDialog,
                scrollController: _scrollController,
                sortBy: _sortBy,
                onApplyFilters: _applyFilters,
              ),
              _PartsMarketContent(
                searchController: _searchController,
                selectedCategoryIds: _selectedCategoryIds,
                onCategorySelected: (MarketCategoryEntity category) {
                  setState(() {
                    if (_selectedCategoryIds.contains(category.id)) {
                      _selectedCategoryIds.remove(category.id);
                    } else {
                      _selectedCategoryIds.add(category.id);
                    }
                  });
                  _applyFilters();
                },
                onFiltersDialog: _showFiltersDialog,
                scrollController: _scrollController,
                sortBy: _sortBy,
                onApplyFilters: _applyFilters,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Контент маркета с категориями, поиском и продуктами
class _MarketContent extends StatelessWidget {
  final String productType; // 'aircraft' или 'parts'
  final TextEditingController searchController;
  final List<int> selectedCategoryIds;
  final void Function(MarketCategoryEntity) onCategorySelected;
  final VoidCallback onFiltersDialog;
  final ScrollController scrollController;
  final String? sortBy;
  final VoidCallback onApplyFilters;

  const _MarketContent({
    required this.productType,
    required this.searchController,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
    required this.onFiltersDialog,
    required this.scrollController,
    this.sortBy,
    required this.onApplyFilters,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
        // Ждем немного, чтобы показать индикатор обновления
        await Future<void>.delayed(const Duration(milliseconds: 500));
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Категории
          BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
            builder: (context, state) => state.when(
              loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              error: (message) => const SliverToBoxAdapter(child: SizedBox.shrink()),
              success: (categories) => SliverToBoxAdapter(
                child: _CategoriesSection(
                  categories: categories,
                  selectedCategoryIds: selectedCategoryIds,
                  onCategorySelected: onCategorySelected,
                ),
              ),
            ),
          ),
          // Поиск и фильтры
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Поиск',
                        prefixIcon: Icon(Icons.search, size: 20.0),
                        suffixIcon: IconButton(icon: Icon(Icons.tune, size: 20.0), onPressed: onFiltersDialog),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Список продуктов
          BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
            builder: (context, state) => state.when(
              loading: () => const SliverFillRemaining(child: Center(child: LoadingCustom())),
              loadingMore: (products) => _ProductsSliverGrid(products: products, isLoadingMore: true, sortBy: sortBy),
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => SliverFillRemaining(
                child: ErrorCustom(paddingTop: 0, textError: errorForUser, repeat: onApplyFilters),
              ),
              success: (products, hasMore) =>
                  _ProductsSliverGrid(products: products, isLoadingMore: false, hasMore: hasMore, sortBy: sortBy),
            ),
          ),
        ],
      ),
    );
  }
}

// Виджет категорий
class _CategoriesSection extends StatefulWidget {
  final List<MarketCategoryEntity> categories;
  final List<int> selectedCategoryIds;
  final void Function(MarketCategoryEntity) onCategorySelected;

  const _CategoriesSection({
    required this.categories,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
  });

  @override
  State<_CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<_CategoriesSection> {
  late final ScrollController _scrollController;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categories.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        GestureDetector(
          onPanStart: (_) {
            setState(() {
              _isDragging = true;
            });
          },
          onPanUpdate: (details) {
            if (_scrollController.hasClients) {
              _scrollController.position.moveTo(
                (_scrollController.position.pixels - details.delta.dx).clamp(
                  0.0,
                  _scrollController.position.maxScrollExtent,
                ),
              );
            }
          },
          onPanEnd: (_) {
            setState(() {
              _isDragging = false;
            });
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: _isDragging ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                ...widget.categories.map(
                  (category) => _CategoryCard(
                    category: category,
                    isSelected: widget.selectedCategoryIds.contains(category.id),
                    onTap: _isDragging ? () {} : () => widget.onCategorySelected(category),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

// Карточка категории
class _CategoryCard extends StatelessWidget {
  final MarketCategoryEntity category;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryCard({required this.category, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isSelected ? 0.5 : 1.0,
        child: Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary100p.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.primary100p : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category.iconUrl != null && category.iconUrl!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Image.network(
                    getImageUrl(category.iconUrl!),
                    height: 50,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(),
                  ),
                ),
              Text(
                category.name.replaceAll('самолёты', '').replaceAll('самолёт', '').replaceAll('Самолёт', '').trim(),
                style: AppStyles.regular10s.copyWith(color: isSelected ? AppColors.primary100p : AppColors.textPrimary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Диалог фильтров
class _FiltersDialog extends StatefulWidget {
  final String productType;
  final int? priceFrom;
  final int? priceTo;
  final String? brand;
  final String sortBy;

  const _FiltersDialog({required this.productType, this.priceFrom, this.priceTo, this.brand, required this.sortBy});

  @override
  State<_FiltersDialog> createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<_FiltersDialog> {
  late String? _priceFromText;
  late String? _priceToText;
  late String? _brand;
  late String _sortBy;

  @override
  void initState() {
    super.initState();
    _priceFromText = widget.priceFrom?.toString();
    _priceToText = widget.priceTo?.toString();
    _brand = widget.brand;
    _sortBy = widget.sortBy;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Фильтры'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Цена
            Text('Цена', style: AppStyles.bold16s),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _priceFromText),
                    decoration: InputDecoration(
                      labelText: 'От',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _priceFromText = value.isEmpty ? null : value,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _priceToText),
                    decoration: InputDecoration(
                      labelText: 'До',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _priceToText = value.isEmpty ? null : value,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Сортировка
            Text('Сортировка', style: AppStyles.bold16s),
            SizedBox(height: 8),
            ...['default', 'date', 'price_asc', 'price_desc'].map((sort) {
              return RadioListTile<String>(
                title: Text(_getSortName(sort)),
                value: sort,
                groupValue: _sortBy,
                onChanged: (value) => setState(() => _sortBy = value!),
              );
            }).toList(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop({'priceFrom': null, 'priceTo': null, 'brand': null, 'sortBy': 'default'}),
          child: const Text('Очистить'),
        ),
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
        TextButton(
          onPressed: () => Navigator.of(context).pop({
            'priceFrom': _priceFromText != null ? int.tryParse(_priceFromText!) : null,
            'priceTo': _priceToText != null ? int.tryParse(_priceToText!) : null,
            'brand': _brand,
            'sortBy': _sortBy,
          }),
          child: const Text('Поиск'),
        ),
      ],
    );
  }

  String _getSortName(String sort) {
    switch (sort) {
      case 'default':
        return 'По умолчанию';
      case 'date':
        return 'По дате';
      case 'price_asc':
        return 'Дешевле';
      case 'price_desc':
        return 'Дороже';
      default:
        return sort;
    }
  }
}

// Контент маркета для запчастей
class _PartsMarketContent extends StatelessWidget {
  final TextEditingController searchController;
  final List<int> selectedCategoryIds;
  final void Function(MarketCategoryEntity) onCategorySelected;
  final VoidCallback onFiltersDialog;
  final ScrollController scrollController;
  final String? sortBy;
  final VoidCallback onApplyFilters;

  const _PartsMarketContent({
    required this.searchController,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
    required this.onFiltersDialog,
    required this.scrollController,
    this.sortBy,
    required this.onApplyFilters,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
        // Ждем немного, чтобы показать индикатор обновления
        await Future<void>.delayed(const Duration(milliseconds: 500));
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Категории
          BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
            builder: (context, state) => state.when(
              loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              error: (message) => const SliverToBoxAdapter(child: SizedBox.shrink()),
              success: (categories) => SliverToBoxAdapter(
                child: _CategoriesSection(
                  categories: categories,
                  selectedCategoryIds: selectedCategoryIds,
                  onCategorySelected: onCategorySelected,
                ),
              ),
            ),
          ),
          // Поиск и фильтры
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Поиск',
                        prefixIcon: Icon(Icons.search, size: 20.0),
                        suffixIcon: IconButton(icon: Icon(Icons.tune, size: 20.0), onPressed: onFiltersDialog),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Список запчастей
          BlocBuilder<PartsMarketBloc, PartsMarketState>(
            builder: (context, state) => state.when(
              loading: () => const SliverFillRemaining(child: Center(child: LoadingCustom())),
              loadingMore: (List<PartsMarketEntity> parts) =>
                  _PartsSliverGrid(parts: parts, isLoadingMore: true, sortBy: sortBy),
              error:
                  (
                    String? errorFromApi,
                    String errorForUser,
                    String? statusCode,
                    StackTrace? stackTrace,
                    String? responseMessage,
                  ) => SliverFillRemaining(
                    child: ErrorCustom(paddingTop: 0, textError: errorForUser, repeat: onApplyFilters),
                  ),
              success: (List<PartsMarketEntity> parts, bool hasMore) =>
                  _PartsSliverGrid(parts: parts, isLoadingMore: false, hasMore: hasMore, sortBy: sortBy),
              creatingPart: () => const SliverFillRemaining(child: Center(child: LoadingCustom())),
              createdPart: (PartsMarketEntity part) {
                // После создания показываем loading, refresh загрузит данные
                return const SliverFillRemaining(child: Center(child: LoadingCustom()));
              },
              updating: () => const SliverFillRemaining(child: Center(child: LoadingCustom())),
              updated: (PartsMarketEntity part) {
                // После обновления показываем loading, refresh загрузит данные
                return const SliverFillRemaining(child: Center(child: LoadingCustom()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Сетка продуктов как Sliver
class _ProductsSliverGrid extends StatelessWidget {
  final List<AircraftMarketEntity> products;
  final bool isLoadingMore;
  final bool hasMore;
  final String? sortBy;

  const _ProductsSliverGrid({required this.products, this.isLoadingMore = false, this.hasMore = false, this.sortBy});

  @override
  Widget build(BuildContext context) {
    final isTablet = Provider.of<AppState>(context, listen: false).isTablet;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // По умолчанию и при сортировке "по дате" показываем последние добавленные товары сверху
    final displayedProducts = [...products];
    if (sortBy == null || sortBy == 'default' || sortBy == 'date') {
      displayedProducts.sort(
        (a, b) => (b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)).compareTo(
          a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
        ),
      );
    }

    if (displayedProducts.isEmpty && !isLoadingMore) {
      return SliverFillRemaining(
        child: Center(
          child: Text('Продукты не найдены', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
        ),
      );
    }

    // Определяем количество колонок: на вебе адаптивно по ширине, в ландшафте 3, иначе 2
    final crossAxisCount = kIsWeb
        ? () {
            final width = MediaQuery.of(context).size.width;
            if (width >= 1200) return 4;
            if (width >= 900) return 3;
            if (width >= 600) return 2;
            return 1;
          }()
        : (isLandscape ? 3 : (isTablet ? 2 : 2));

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: kIsWeb ? 1.0 : (isTablet ? 1.0 : 0.9),
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = displayedProducts[index];
          return AircraftMarketCard(
            product: product,
            showEditButtons: false,
            showYearAndLocation: false,
            showInactiveBadge: false,
            onTap: () {
              context.router.push(AircraftMarketDetailRoute(id: product.id));
            },
          );
        }, childCount: displayedProducts.length),
      ),
    );
  }
}

// Сетка запчастей как Sliver
class _PartsSliverGrid extends StatelessWidget {
  final List<PartsMarketEntity> parts;
  final bool isLoadingMore;
  final bool hasMore;
  final String? sortBy;

  const _PartsSliverGrid({required this.parts, this.isLoadingMore = false, this.hasMore = false, this.sortBy});

  @override
  Widget build(BuildContext context) {
    final isTablet = Provider.of<AppState>(context, listen: false).isTablet;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // По умолчанию и при сортировке "по дате" показываем последние добавленные запчасти сверху
    final displayedParts = [...parts];
    if (sortBy == null || sortBy == 'default' || sortBy == 'date') {
      displayedParts.sort(
        (a, b) => (b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)).compareTo(
          a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
        ),
      );
    } else if (sortBy == 'price_asc') {
      displayedParts.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortBy == 'price_desc') {
      displayedParts.sort((a, b) => b.price.compareTo(a.price));
    }

    if (displayedParts.isEmpty && !isLoadingMore) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey.shade400),
              SizedBox(height: 16),
              Text('Запчасти не найдены', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ),
      );
    }

    final crossAxisCount = kIsWeb
        ? () {
            final width = MediaQuery.of(context).size.width;
            if (width >= 1200) return 4;
            if (width >= 900) return 3;
            if (width >= 600) return 2;
            return 1;
          }()
        : (isLandscape ? 3 : (isTablet ? 2 : 2));

    return SliverPadding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: kIsWeb ? 1.0 : (isTablet ? 1.0 : 0.9),
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final part = displayedParts[index];
          return PartsMarketCard(
            part: part,
            showEditButtons: false,
            showCategoryAndManufacturer: true,
            showLocation: true,
            showInactiveBadge: false,
            onTap: () {
              context.router.push(PartsMarketDetailRoute(id: part.id));
            },
          );
        }, childCount: displayedParts.length),
      ),
    );
  }
}

/// Кнопка профиля для маркета
class _MarketProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: true).isAuthenticated;
    final iconSize = 28.0;

    if (!isAuthenticated) {
      // Не авторизован: открываем bottom sheet авторизации
      return IconButton(
        constraints: const BoxConstraints(),
        iconSize: iconSize,
        icon: SvgPicture.asset(
          Pictures.profileNavbar,
          height: iconSize,
          width: iconSize,
          colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
        ),
        onPressed: () => showLogin(context),
        tooltip: 'Профиль',
      );
    }

    // Авторизован: показываем аватар и просто переключаем вкладку профиля в AutoTabsScaffold
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final avatarUrl = state.maybeWhen< String? >(
          success: (profile) => profile.avatarUrl,
          orElse: () => null,
        );

        final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

        return IconButton(
          constraints: BoxConstraints(),
          iconSize: iconSize,
          icon: ClipOval(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? NetworkImageWidget(
                      imageUrl: imageUrl,
                      width: iconSize,
                      height: iconSize,
                      fit: BoxFit.cover,
                      placeholder: SvgPicture.asset(
                        Pictures.profileNavbar,
                        height: iconSize,
                        width: iconSize,
                        colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                      ),
                      errorWidget: SvgPicture.asset(
                        Pictures.profileNavbar,
                        height: iconSize,
                        width: iconSize,
                        colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                      ),
                    )
                  : SvgPicture.asset(
                      Pictures.profileNavbar,
                      height: iconSize,
                      width: iconSize,
                      colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn),
                    ),
            ),
          ),
          onPressed: () {
            // Переключаемся на вкладку профиля в корневом AutoTabsScaffold
            try {
              final tabsRouter = AutoTabsRouter.of(context);
              tabsRouter.setActiveIndex(6); // индекс профиля в BaseScreen.routes
            } catch (_) {
              // В крайнем случае ничего не делаем
            }
          },
          tooltip: 'Профиль',
        );
      },
    );
  }
}
