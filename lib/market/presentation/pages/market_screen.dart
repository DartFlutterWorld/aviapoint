import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

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
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);

    // Загружаем начальные данные
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: _currentProductType));
    context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.getProducts());
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

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      _currentProductType = _tabController.index == 0 ? 'aircraft' : 'parts';
      _selectedCategoryIds = [];
    });
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: _currentProductType));
    context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.getProducts());
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      final state = context.read<AircraftMarketBloc>().state;
      state.maybeWhen(
        success: (products, hasMore) {
          if (hasMore) {
            context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.loadMore());
          }
        },
        orElse: () {},
      );
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
            context.router.push(const CreateAircraftMarketRoute());
          }
        },
      );
    } else {
      // Если авторизован, сразу переходим на создание объявления
      context.router.push(const CreateAircraftMarketRoute());
    }
  }

  void _showFiltersDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => _FiltersDialog(productType: _currentProductType, priceFrom: _priceFrom, priceTo: _priceTo, brand: _brand, sortBy: _sortBy),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButtonWidget(title: 'Создать\nобъявление', onTap: () => _handleCreateAdButtonTap(context)),
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
              leadingWidth: 60.w,
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
                controller: _tabController,
                labelColor: Color(0xFF0A6EFA),
                unselectedLabelColor: Color(0xFF9CA5AF),
                indicatorColor: Color(0xFF0A6EFA),
                dividerColor: Colors.transparent,
                labelStyle: AppStyles.bold14s,
                unselectedLabelStyle: AppStyles.regular14s,
                tabs: const [
                  Tab(text: 'Самолёты и вертолёты'),
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
            _MarketContent(
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
    );
  }
}

// Контент маркета с категориями, поиском и продуктами
class _MarketContent extends StatelessWidget {
  final TextEditingController searchController;
  final List<int> selectedCategoryIds;
  final void Function(MarketCategoryEntity) onCategorySelected;
  final VoidCallback onFiltersDialog;
  final ScrollController scrollController;
  final String? sortBy;
  final VoidCallback onApplyFilters;

  const _MarketContent({
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
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        // Категории
        BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
          builder: (context, state) => state.when(
            loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
            error: (message) => const SliverToBoxAdapter(child: SizedBox.shrink()),
            success: (categories) => SliverToBoxAdapter(
              child: _CategoriesSection(categories: categories, selectedCategoryIds: selectedCategoryIds, onCategorySelected: onCategorySelected),
            ),
          ),
        ),
        // Поиск и фильтры
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search, size: 20.sp),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.tune, size: 20.sp),
                        onPressed: onFiltersDialog,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
            loading: () => SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            loadingMore: (products) => _ProductsSliverGrid(products: products, isLoadingMore: true, sortBy: sortBy),
            error: (message) => SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                    SizedBox(height: 16.h),
                    ElevatedButton(onPressed: onApplyFilters, child: const Text('Повторить')),
                  ],
                ),
              ),
            ),
            success: (products, hasMore) => _ProductsSliverGrid(products: products, isLoadingMore: false, hasMore: hasMore, sortBy: sortBy),
            creatingAirCraft: () => SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            createdAirCraft: (product) => SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            updating: () => SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            updated: (product) => SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
          ),
        ),
      ],
    );
  }
}

// Виджет категорий
class _CategoriesSection extends StatefulWidget {
  final List<MarketCategoryEntity> categories;
  final List<int> selectedCategoryIds;
  final void Function(MarketCategoryEntity) onCategorySelected;

  const _CategoriesSection({required this.categories, required this.selectedCategoryIds, required this.onCategorySelected});

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
        SizedBox(height: 8.h),
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
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [...widget.categories.map((category) => _CategoryCard(category: category, isSelected: widget.selectedCategoryIds.contains(category.id), onTap: _isDragging ? () {} : () => widget.onCategorySelected(category)))],
            ),
          ),
        ),
        SizedBox(height: 8.h),
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
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary100p.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: isSelected ? AppColors.primary100p : Colors.grey.shade300, width: isSelected ? 2.w : 1.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category.iconUrl != null && category.iconUrl!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: Image.network(getImageUrl(category.iconUrl!), height: 50.h, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const SizedBox()),
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
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _priceFromText),
                    decoration: InputDecoration(
                      labelText: 'От',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _priceFromText = value.isEmpty ? null : value,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _priceToText),
                    decoration: InputDecoration(
                      labelText: 'До',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _priceToText = value.isEmpty ? null : value,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Сортировка
            Text('Сортировка', style: AppStyles.bold16s),
            SizedBox(height: 8.h),
            ...['default', 'date', 'price_asc', 'price_desc'].map((sort) {
              return RadioListTile<String>(title: Text(_getSortName(sort)), value: sort, groupValue: _sortBy, onChanged: (value) => setState(() => _sortBy = value!));
            }).toList(),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop({'priceFrom': null, 'priceTo': null, 'brand': null, 'sortBy': 'default'}), child: const Text('Очистить')),
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
        TextButton(
          onPressed: () => Navigator.of(
            context,
          ).pop({'priceFrom': _priceFromText != null ? int.tryParse(_priceFromText!) : null, 'priceTo': _priceToText != null ? int.tryParse(_priceToText!) : null, 'brand': _brand, 'sortBy': _sortBy}),
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
      displayedProducts.sort((a, b) => (b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)).compareTo(a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0)));
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
      padding: EdgeInsets.all(8.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, crossAxisSpacing: 8.w, mainAxisSpacing: 8.h, childAspectRatio: kIsWeb ? 0.95 : (isTablet ? 0.8 : 0.67)),
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = displayedProducts[index];
          return AircraftMarketCard(
            product: product,
            showEditButtons: false,
            showYearAndLocation: true,
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

/// Кнопка профиля для маркета
class _MarketProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: true).isAuthenticated;
    final iconSize = 28.sp;

    if (!isAuthenticated) {
      return IconButton(
        constraints: const BoxConstraints(),
        iconSize: iconSize,
        icon: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
        onPressed: () => AutoRouter.of(context).push(const ProfileNavigationRoute()),
        tooltip: 'Профиль',
      );
    }

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final avatarUrl = state.maybeWhen(success: (profile) => profile.avatarUrl, orElse: () => null);

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
                      placeholder: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
                      errorWidget: SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
                    )
                  : SvgPicture.asset(Pictures.profileNavbar, height: iconSize, width: iconSize, colorFilter: const ColorFilter.mode(Color(0xFF223B76), BlendMode.srcIn)),
            ),
          ),
          onPressed: () => AutoRouter.of(context).push(const ProfileNavigationRoute()),
          tooltip: 'Профиль',
        );
      },
    );
  }
}
