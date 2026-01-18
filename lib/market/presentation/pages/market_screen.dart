import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/widgets/aircraft_market_card.dart';
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
  int? _selectedCategoryId;
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
      _selectedCategoryId = null;
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
    context.read<AircraftMarketBloc>().add(
      AircraftMarketEvent.getProducts(
        aircraftSubcategoriesId: _selectedCategoryId,
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
      appBar: CustomAppBar(
        title: 'Маркет',
        withBack: false,
        withProfile: true,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.favorite_outline),
          //   onPressed: () {
          //     // TODO: Переход к избранному
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart_outlined),
          //   onPressed: () {
          //     // TODO: Переход к корзине
          //   },
          // ),
        ],
      ),
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleCreateAdButtonTap(context),
        backgroundColor: AppColors.primary100p,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          // Табы
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary100p,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary100p,
            tabs: const [
              Tab(text: 'Самолёты и вертолёты'),
              Tab(text: 'Запчасти'),
            ],
          ),
          // Категории
          BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
            builder: (context, state) => state.when(
              loading: () => const SizedBox.shrink(),
              error: (message) => const SizedBox.shrink(),
              success: (categories) => _CategoriesSection(
                categories: categories,
                selectedCategoryId: _selectedCategoryId,
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategoryId = category.id;
                    _selectedCategoryIds = [category.id];
                  });
                  _applyFilters();
                },
              ),
            ),
          ),
          // Поиск и фильтры
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: _currentProductType == 'aircraft' ? 'Поиск самолётов' : 'Поиск запчастей',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(icon: const Icon(Icons.tune), onPressed: _showFiltersDialog),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Список продуктов
          Expanded(
            child: BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
              builder: (context, state) => state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loadingMore: (products) => _ProductsGrid(products: products, isLoadingMore: true, scrollController: _scrollController),
                error: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(message, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
                      SizedBox(height: 16.h),
                      ElevatedButton(onPressed: _applyFilters, child: const Text('Повторить')),
                    ],
                  ),
                ),
                success: (products, hasMore) => _ProductsGrid(products: products, isLoadingMore: false, hasMore: hasMore, scrollController: _scrollController),
                creatingAirCraft: () {
                  // Показываем текущий список продуктов с индикатором загрузки
                  // Используем BlocBuilder для получения предыдущего состояния
                  final previousState = context.read<AircraftMarketBloc>().state;
                  if (previousState is SuccessAircraftMarketState) {
                    return _ProductsGrid(products: previousState.products, isLoadingMore: false, hasMore: previousState.hasMore, scrollController: _scrollController);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                createdAirCraft: (product) {
                  // После создания обновляем список
                  context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
                  final previousState = context.read<AircraftMarketBloc>().state;
                  if (previousState is SuccessAircraftMarketState) {
                    return _ProductsGrid(products: previousState.products, isLoadingMore: false, hasMore: previousState.hasMore, scrollController: _scrollController);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                updating: () {
                  // Показываем текущий список продуктов с индикатором загрузки
                  // Используем BlocBuilder для получения предыдущего состояния
                  return BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
                    buildWhen: (previous, current) => current is! UpdatingMarketProductState,
                    builder: (context, previousState) {
                      final currentProducts = previousState.maybeWhen(success: (products, hasMore) => products, loadingMore: (products) => products, orElse: () => <AircraftMarketEntity>[]);
                      return _ProductsGrid(products: currentProducts, isLoadingMore: true, hasMore: true, scrollController: _scrollController);
                    },
                  );
                },
                updated: (product) {
                  // После updated сразу возвращаемся к success, показываем обновленный список
                  // Используем BlocBuilder для получения текущего состояния
                  return BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
                    buildWhen: (previous, current) => current is SuccessAircraftMarketState,
                    builder: (context, currentState) {
                      final products = currentState.maybeWhen(success: (products, hasMore) => products, orElse: () => <AircraftMarketEntity>[]);
                      return _ProductsGrid(products: products, isLoadingMore: false, hasMore: true, scrollController: _scrollController);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Виджет категорий
class _CategoriesSection extends StatelessWidget {
  final List<MarketCategoryEntity> categories;
  final int? selectedCategoryId;
  final void Function(MarketCategoryEntity) onCategorySelected;

  const _CategoriesSection({required this.categories, required this.selectedCategoryId, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [...categories.map((category) => _CategoryCard(category: category, isSelected: selectedCategoryId == category.id, onTap: () => onCategorySelected(category)))],
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
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100p.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: isSelected ? AppColors.primary100p : Colors.grey.shade300, width: isSelected ? 2 : 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (category.iconUrl != null && category.iconUrl!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Image.network(getImageUrl(category.iconUrl!), height: 50.h, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => const SizedBox()),
              ),
            Text(
              category.name.replaceAll('самолёт', '').replaceAll('Самолёт', '').trim(),
              style: AppStyles.regular14s.copyWith(color: isSelected ? AppColors.primary100p : AppColors.textPrimary, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ],
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

// Сетка продуктов
class _ProductsGrid extends StatelessWidget {
  final List<AircraftMarketEntity> products;
  final bool isLoadingMore;
  final bool hasMore;
  final ScrollController scrollController;

  const _ProductsGrid({required this.products, this.isLoadingMore = false, this.hasMore = false, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty && !isLoadingMore) {
      return Center(
        child: Text('Продукты не найдены', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
      );
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.all(8.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: kIsWeb ? 3 : 2, crossAxisSpacing: 8.w, mainAxisSpacing: 8.h, childAspectRatio: kIsWeb ? 0.95 : 0.67),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return AircraftMarketCard(
                product: product,
                showEditButtons: false,
                showYearAndLocation: true,
                showInactiveBadge: false,
                onTap: () {
                  context.router.push(AircraftMarketDetailRoute(id: product.id));
                },
              );
            },
          ),
        ),
        if (isLoadingMore) Padding(padding: EdgeInsets.all(16.w), child: const CircularProgressIndicator()),
        if (!hasMore && products.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text('Все продукты загружены', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
          ),
      ],
    );
  }
}
