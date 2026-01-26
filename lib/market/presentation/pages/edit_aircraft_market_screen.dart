import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/market/presentation/widgets/share_picker_widget.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

@RoutePage()
class EditAircraftMarketScreen extends StatefulWidget {
  final AircraftMarketEntity product;

  const EditAircraftMarketScreen({super.key, required this.product});

  @override
  State<EditAircraftMarketScreen> createState() => _EditAircraftMarketScreenState();
}

class _EditAircraftMarketScreenState extends State<EditAircraftMarketScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _brandController;
  late final TextEditingController _yearController;
  late final TextEditingController _totalFlightHoursController;
  late final TextEditingController _enginePowerController;
  late final TextEditingController _engineVolumeController;
  late final TextEditingController _seatsController;
  late final TextEditingController _leasingConditionsController;

  String? _condition;
  int? _selectedCategoryId;
  String? _selectedBrand;
  String? _selectedLocation;

  // Продажа доли
  bool _isShareSale = false;
  int? _shareNumerator;
  int? _shareDenominator;

  // Фотографии
  _PhotoItem? _mainPhoto; // Основная фотография
  List<_PhotoItem> _additionalPhotos = []; // Дополнительные фотографии

  static const List<String> _validConditionValues = ['new', 'used', 'restored'];

  // Лизинг
  bool _isLeasing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title);
    _descriptionController = TextEditingController(text: widget.product.description ?? '');
    _priceController = TextEditingController(text: widget.product.price.toString());
    _brandController = TextEditingController(text: widget.product.brand ?? '');
    _yearController = TextEditingController(text: widget.product.year?.toString() ?? '');
    _totalFlightHoursController = TextEditingController(text: widget.product.totalFlightHours?.toString() ?? '');
    _enginePowerController = TextEditingController(text: widget.product.enginePower?.toString() ?? '');
    _engineVolumeController = TextEditingController(text: widget.product.engineVolume?.toString() ?? '');
    _seatsController = TextEditingController(text: widget.product.seats?.toString() ?? '');
    // Валидация значений из БД - только если значение присутствует в списке допустимых
    _condition = widget.product.condition != null && _validConditionValues.contains(widget.product.condition) ? widget.product.condition : null;
    _selectedCategoryId = widget.product.aircraftSubcategoriesId;
    _selectedBrand = widget.product.brand;
    _selectedLocation = widget.product.location;
    _isShareSale = widget.product.isShareSale ?? false;
    _shareNumerator = widget.product.shareNumerator;
    _shareDenominator = widget.product.shareDenominator;
    _isLeasing = widget.product.isLeasing ?? false;
    _leasingConditionsController = TextEditingController(text: widget.product.leasingConditions ?? '');

    // Загружаем категории для выбора
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: 'aircraft'));

    // Инициализируем фотографии (только непустые URL)
    if (widget.product.mainImageUrl != null && widget.product.mainImageUrl!.isNotEmpty) {
      _mainPhoto = _PhotoItem(url: widget.product.mainImageUrl, file: null, isNew: false);
    }
    _additionalPhotos = widget.product.additionalImageUrls.where((url) => url.isNotEmpty).map((url) => _PhotoItem(url: url, file: null, isNew: false)).toList();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _brandController.dispose();
    _yearController.dispose();
    _totalFlightHoursController.dispose();
    _enginePowerController.dispose();
    _engineVolumeController.dispose();
    _seatsController.dispose();
    _leasingConditionsController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Дополнительная валидация для полей, которые не используют TextFormField
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите категорию'), backgroundColor: Colors.red));
      return;
    }

    if (_condition == null || _condition!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите состояние'), backgroundColor: Colors.red));
      return;
    }

    if (_selectedBrand == null || _selectedBrand!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите самолёт'), backgroundColor: Colors.red));
      return;
    }

    if (_selectedLocation == null || _selectedLocation!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите местоположение'), backgroundColor: Colors.red));
      return;
    }

    // Проверка основной фотографии
    final hasValidMainPhoto = _mainPhoto != null && (_mainPhoto!.isNew || (_mainPhoto!.url != null && _mainPhoto!.url!.isNotEmpty));
    if (!hasValidMainPhoto) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Добавьте основную фотографию'), backgroundColor: Colors.red));
      return;
    }

    if (!mounted) return;

    final bloc = context.read<AircraftMarketBloc>();

    // Подготавливаем данные для основной фотографии
    String? mainImageUrl;
    XFile? mainImageFile;

    final hadOldMainImage = widget.product.mainImageUrl != null && widget.product.mainImageUrl!.isNotEmpty;

    if (_mainPhoto != null && _mainPhoto!.isNew) {
      // Новая фотография - передаем только файл, бэкенд сам заменит старую
      mainImageFile = _mainPhoto!.file;
      // НЕ передаём mainImageUrl = '' - бэкенд должен сам удалить старую при загрузке новой
    } else if (_mainPhoto != null && _mainPhoto!.url != null && _mainPhoto!.url!.isNotEmpty) {
      // Существующая фотография - передаем URL
      mainImageUrl = _mainPhoto!.url;
    } else if (hadOldMainImage) {
      // Фотография удалена - передаем пустую строку для удаления
      mainImageUrl = '';
    }

    // Подготавливаем дополнительные фотографии
    List<String> additionalImageUrls = [];
    List<XFile>? additionalImageFiles;

    final newAdditionalPhotos = _additionalPhotos.where((photo) => photo.isNew).toList();
    final existingAdditionalPhotos = _additionalPhotos.where((photo) => !photo.isNew && photo.url != null && photo.url!.isNotEmpty).toList();

    // Всегда передаем существующие URL (которые не были удалены)
    additionalImageUrls.addAll(existingAdditionalPhotos.map((photo) => photo.url!));

    // Если есть новые файлы - передаем их тоже
    if (newAdditionalPhotos.isNotEmpty) {
      additionalImageFiles = newAdditionalPhotos.map((photo) => photo.file!).toList();
    }

    // Если все удалены, передаем пустой список
    if (additionalImageUrls.isEmpty && newAdditionalPhotos.isEmpty && widget.product.additionalImageUrls.isNotEmpty) {
      additionalImageUrls = [];
    }

    // Отправляем запрос на обновление товара - ответ обработается в listener
    bloc.add(
      AircraftMarketEvent.updateProduct(
        productId: widget.product.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
        price: int.tryParse(_priceController.text.trim()) ?? widget.product.price,
        aircraftSubcategoriesId: _selectedCategoryId,
        brand: _selectedBrand,
        location: _selectedLocation,
        year: _yearController.text.trim().isEmpty ? null : int.tryParse(_yearController.text.trim()),
        totalFlightHours: _totalFlightHoursController.text.trim().isEmpty ? null : int.tryParse(_totalFlightHoursController.text.trim()),
        enginePower: _enginePowerController.text.trim().isEmpty ? null : int.tryParse(_enginePowerController.text.trim()),
        engineVolume: _engineVolumeController.text.trim().isEmpty ? null : int.tryParse(_engineVolumeController.text.trim()),
        seats: _seatsController.text.trim().isEmpty ? null : int.tryParse(_seatsController.text.trim()),
        condition: _condition,
        isShareSale: _isShareSale,
        shareNumerator: _isShareSale ? _shareNumerator : null,
        shareDenominator: _isShareSale ? _shareDenominator : null,
        isLeasing: _isLeasing,
        leasingConditions: _isLeasing && _leasingConditionsController.text.trim().isNotEmpty ? _leasingConditionsController.text.trim() : null,
        mainImageUrl: mainImageUrl,
        additionalImageUrls: additionalImageUrls,
        mainImageFile: mainImageFile,
        additionalImageFiles: additionalImageFiles,
      ),
    );
  }

  void _showUnpublishConfirmation() {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Снять с публикации?'),
        content: const Text('Объявление станет неактивным и не будет видно другим пользователям.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Отмена')),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _unpublishProduct();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Снять'),
          ),
        ],
      ),
    );
  }

  Future<void> _unpublishProduct() async {
    final repository = getIt<MarketRepository>();
    final result = await repository.unpublishProduct(widget.product.id);
    result.fold(
      (failure) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message ?? 'Ошибка снятия публикации'), backgroundColor: Colors.red));
      },
      (product) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Объявление снято с публикации'), backgroundColor: Colors.green));
        context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
        context.router.maybePop();
      },
    );
  }

  Future<void> _publishProduct() async {
    final repository = getIt<MarketRepository>();
    final result = await repository.publishProduct(widget.product.id);
    result.fold(
      (failure) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message ?? 'Ошибка публикации'), backgroundColor: Colors.red));
      },
      (product) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Объявление опубликовано'), backgroundColor: Colors.green));
        context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
        context.router.maybePop();
      },
    );
  }

  bool _isCurrentUserOwner(int? sellerId) {
    return PermissionHelper.isOwnerOrAdmin(sellerId, context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AircraftMarketBloc, AircraftMarketState>(
      listenWhen: (previous, current) {
        // Реагируем только на updated или error после updating
        if (previous is UpdatingMarketProductState) {
          return current is UpdatedMarketProductState || current is ErrorAircraftMarketState;
        }
        return false;
      },
      listener: (context, state) {
        if (!mounted) return;

        state.maybeWhen(
          updated: (product) async {
            // Показываем сообщение об успехе
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Товар успешно обновлен'), backgroundColor: Colors.green));

            // Проверяем, откуда мы редактируем - проверяем путь до закрытия экрана
            final currentPath = context.router.currentPath;
            final isFromMarket = currentPath.contains('/market');

            // Обновляем список товаров
            if (isFromMarket) {
              // Если мы в маркете, обновляем глобальный BLoC
              final productsBloc = context.read<AircraftMarketBloc>();
              productsBloc.add(const AircraftMarketEvent.refresh());
            }
            // Если мы редактируем из профиля, BlocListener в MyAircraftAdsWidget
            // автоматически обновит список при получении состояния updated

            // Закрываем экран через maybePop для безопасного возврата
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.router.maybePop();
              }
            });
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Редактировать',
          withBack: true,
          actions: [
            BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
              builder: (context, state) {
                final isLoading = state is UpdatingMarketProductState;
                return TextButton(
                  onPressed: isLoading ? null : _saveChanges,
                  child: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CircularProgressIndicator(strokeWidth: 2.w),
                        )
                      : Text('Сохранить', style: AppStyles.bold16s.copyWith(color: AppColors.primary100p)),
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Основная фотография
                _buildMainPhotoSection(),
                SizedBox(height: 16.h),
                // Дополнительные фотографии
                _buildAdditionalPhotosSection(),
                SizedBox(height: 16.h),
                // Категория
                _buildCategoryDropdown(),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Название *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите название товара';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Описание *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите описание';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Цена (₽) *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите цену';
                    }
                    final price = int.tryParse(value.trim());
                    if (price == null || price <= 0) {
                      return 'Введите корректную цену';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildBrandField(),
                SizedBox(height: 16.h),
                LocationPickerWidget(
                  initialLocation: _selectedLocation,
                  onLocationSelected: (locationData) {
                    setState(() {
                      _selectedLocation = locationData['address'] as String?;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _yearController,
                  decoration: InputDecoration(
                    labelText: 'Год выпуска *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите год выпуска';
                    }
                    final year = int.tryParse(value.trim());
                    if (year == null || year <= 0) {
                      return 'Введите корректный год';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _totalFlightHoursController,
                  decoration: InputDecoration(
                    labelText: 'Общий налёт часов *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите общий налёт часов';
                    }
                    final hours = int.tryParse(value.trim());
                    if (hours == null || hours < 0) {
                      return 'Введите корректный общий налёт часов';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _enginePowerController,
                  decoration: InputDecoration(
                    labelText: 'Мощность двигателя *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите мощность двигателя';
                    }
                    final power = int.tryParse(value.trim());
                    if (power == null || power <= 0) {
                      return 'Введите корректную мощность двигателя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _engineVolumeController,
                  decoration: InputDecoration(
                    labelText: 'Объём двигателя *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите объём двигателя';
                    }
                    final volume = int.tryParse(value.trim());
                    if (volume == null || volume <= 0) {
                      return 'Введите корректный объём двигателя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _seatsController,
                  decoration: InputDecoration(
                    labelText: 'Количество мест *',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите количество мест';
                    }
                    final seats = int.tryParse(value.trim());
                    if (seats == null || seats <= 0) {
                      return 'Введите корректное количество мест';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildConditionField(),
                SizedBox(height: 16.h),
                _buildShareSaleField(),
                SizedBox(height: 16.h),
                _buildLeasingField(),
                // Кнопки доступны только автору
                if (_isCurrentUserOwner(widget.product.sellerId)) ...[
                  SizedBox(height: 24.h),
                  // Кнопка "Сохранить" (дублируем из AppBar)
                  BlocBuilder<AircraftMarketBloc, AircraftMarketState>(
                    builder: (context, state) {
                      final isLoading = state is UpdatingMarketProductState;
                      return CustomButton(
                        title: isLoading ? 'Сохранение...' : 'Сохранить',
                        verticalPadding: 12.h,
                        backgroundColor: AppColors.primary100p,
                        textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                        borderColor: AppColors.primary100p,
                        borderRadius: 12.r,
                        onPressed: isLoading ? null : _saveChanges,
                        disabled: isLoading,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  // Кнопка "Снять с публикации" или "Опубликовать" в зависимости от статуса
                  if (widget.product.isActive)
                    CustomButton(
                      title: 'Снять с публикации',
                      verticalPadding: 12.h,
                      backgroundColor: Colors.red,
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: Colors.red,
                      borderRadius: 12.r,
                      onPressed: _showUnpublishConfirmation,
                    )
                  else
                    CustomButton(
                      title: 'Опубликовать',
                      verticalPadding: 12.h,
                      backgroundColor: AppColors.primary100p,
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: AppColors.primary100p,
                      borderRadius: 12.r,
                      onPressed: _publishProduct,
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandField() {
    final displayText = _selectedBrand ?? 'Выберите самолёт';

    return InkWell(
      onTap: () => _showAircraftSelector(),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Модель *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(displayText, style: AppStyles.regular14s.copyWith(color: _selectedBrand != null ? AppColors.textPrimary : AppColors.textSecondary)),
      ),
    );
  }

  Future<void> _showAircraftSelector() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AircraftTypeSelectorDialog(initialValue: _selectedBrand),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedBrand = result;
      });
    }
  }

  Widget _buildCategoryDropdown() {
    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (categories) {
            if (categories.isEmpty) {
              return const SizedBox.shrink();
            }
            return _buildCategoryField(categories);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildCategoryField(List<MarketCategoryEntity> categories) {
    MarketCategoryEntity? selectedCategory;
    if (_selectedCategoryId != null) {
      try {
        selectedCategory = categories.firstWhere((category) => category.id == _selectedCategoryId);
      } catch (e) {
        selectedCategory = null;
      }
    }
    final displayText = selectedCategory != null ? selectedCategory.name : 'Выберите категорию';

    return InkWell(
      onTap: () => _showCategoryBottomSheet(categories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Категория *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(displayText, style: AppStyles.regular14s.copyWith(color: _selectedCategoryId != null ? AppColors.textPrimary : AppColors.textSecondary)),
      ),
    );
  }

  Widget _buildConditionField() {
    String displayText = 'Выберите состояние';
    if (_condition != null) {
      switch (_condition) {
        case 'new':
          displayText = 'Новый';
          break;
        case 'used':
          displayText = 'Б/у';
          break;
        case 'restored':
          displayText = 'Восстановленный';
          break;
        case 'parts':
          displayText = 'На запчасти';
          break;
      }
    }

    return InkWell(
      onTap: () => _showConditionBottomSheet(),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Состояние *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(displayText, style: AppStyles.regular14s.copyWith(color: _condition != null ? AppColors.textPrimary : AppColors.textSecondary)),
      ),
    );
  }

  Future<void> _showCategoryBottomSheet(List<MarketCategoryEntity> categories) async {
    // Находим индекс выбранной категории для автоматической прокрутки
    int? selectedIndex;
    if (_selectedCategoryId != null) {
      try {
        selectedIndex = categories.indexWhere((category) => category.id == _selectedCategoryId);
        if (selectedIndex == -1) selectedIndex = null;
      } catch (e) {
        selectedIndex = null;
      }
    }

    final ScrollController scrollController = ScrollController();

    // Прокручиваем к выбранной категории после построения виджета
    if (selectedIndex != null && selectedIndex >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          final itemHeight = 56.0; // Примерная высота ListTile
          final scrollOffset = selectedIndex! * itemHeight;
          scrollController.animateTo(scrollOffset.clamp(0.0, scrollController.position.maxScrollExtent), duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        }
      });
    }

    await showUniversalBottomSheet<int>(
      context: context,
      title: 'Выберите категорию',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategoryId == category.id;
          return ListTile(
            title: Text(category.name, style: AppStyles.regular14s),
            trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p, size: 24.sp) : null,
            selected: isSelected,
            selectedTileColor: AppColors.primary100p.withOpacity(0.1),
            onTap: () {
              setState(() {
                _selectedCategoryId = category.id;
              });
              Navigator.pop(context, category.id);
            },
          );
        },
      ),
    );
  }

  Future<void> _showConditionBottomSheet() async {
    final conditions = [
      {'value': 'new', 'label': 'Новый'},
      {'value': 'used', 'label': 'Б/у'},
      {'value': 'restored', 'label': 'Восстановленный'},
      {'value': 'parts', 'label': 'На запчасти'},
    ];

    await showUniversalBottomSheet<String>(
      context: context,
      title: 'Выберите состояние',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: conditions.length,
        itemBuilder: (context, index) {
          final condition = conditions[index];
          final isSelected = _condition == condition['value'];
          return ListTile(
            title: Text(condition['label']!, style: AppStyles.regular14s),
            trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
            selected: isSelected,
            onTap: () {
              setState(() {
                _condition = condition['value'];
              });
              Navigator.pop(context, condition['value']);
            },
          );
        },
      ),
    );
  }

  Widget _buildShareSaleField() {
    return InkWell(
      onTap: () => _showSharePickerDialog(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Icon(Icons.percent, size: 18, color: Color(0xFF9CA5AF)),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Продажа доли', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                  if (_isShareSale && _shareNumerator != null && _shareDenominator != null)
                    Text('${_shareNumerator}/${_shareDenominator}', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)))
                  else
                    Text('Нажмите для выбора', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF9CA5AF)),
          ],
        ),
      ),
    );
  }

  Widget _buildLeasingField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Самолёт можно купить в лизинг', style: AppStyles.regular14s.copyWith(color: AppColors.netural100p)),
            ),
            Switch(
              value: _isLeasing,
              activeColor: AppColors.primary100p,
              onChanged: (value) {
                setState(() {
                  _isLeasing = value;
                  if (!value) {
                    _leasingConditionsController.clear();
                  }
                });
              },
            ),
          ],
        ),
        if (_isLeasing) ...[
          SizedBox(height: 8.h),
          TextFormField(
            controller: _leasingConditionsController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Условия лизинга',
              alignLabelWithHint: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _showSharePickerDialog() async {
    int? tempNumerator = _shareNumerator;
    int? tempDenominator = _shareDenominator;
    bool tempIsShareSale = _isShareSale;

    await showUniversalBottomSheet<void>(
      context: context,
      title: 'Продажа доли',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: AppColors.background,
      child: StatefulBuilder(
        builder: (context, setModalState) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Чекбокс
            Row(
              children: [
                Checkbox(
                  value: tempIsShareSale,
                  onChanged: (value) {
                    setModalState(() {
                      tempIsShareSale = value ?? false;
                      if (!tempIsShareSale) {
                        tempNumerator = null;
                        tempDenominator = null;
                      }
                    });
                  },
                ),
                Text('Продаётся доля', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
              ],
            ),
            // Виджет выбора доли
            if (tempIsShareSale) ...[
              SizedBox(height: 16.h),
              Text(
                'Выберите долю:',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Center(
                child: SharePickerWidget(
                  numerator: tempNumerator,
                  denominator: tempDenominator,
                  onNumeratorChanged: (value) {
                    setModalState(() {
                      tempNumerator = value;
                      // Если знаменатель стал невалидным (<= числителя), обнуляем его
                      if (value != null && tempDenominator != null && tempDenominator! <= value) {
                        tempDenominator = null;
                      }
                    });
                  },
                  onDenominatorChanged: (value) {
                    setModalState(() {
                      tempDenominator = value;
                    });
                  },
                ),
              ),
            ],
            SizedBox(height: 24.h),
            // Кнопка Сохранить
            CustomButton(
              title: 'Сохранить',
              verticalPadding: 12.h,
              backgroundColor: Color(0xFF0A6EFA),
              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              borderRadius: 12.r,
              boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 4.0))],
              onPressed: () {
                setState(() {
                  _isShareSale = tempIsShareSale;
                  _shareNumerator = tempNumerator;
                  _shareDenominator = tempDenominator;
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildMainPhotoSection() {
    // Проверяем, есть ли валидная фотография (новая или с непустым URL)
    final hasValidPhoto = _mainPhoto != null && (_mainPhoto!.isNew || (_mainPhoto!.url != null && _mainPhoto!.url!.isNotEmpty));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('Основная фотография', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
        SizedBox(height: 16.h),
        if (hasValidPhoto) SizedBox(height: 200.h, child: _buildPhotoItem(_mainPhoto!, isMain: true)) else _buildEmptyPhotoPlaceholder(isMain: true),
      ],
    );
  }

  Widget _buildAdditionalPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Дополнительные фотографии', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
            // TextButton.icon(
            //   onPressed: _pickAdditionalPhotos,
            //   icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
            //   label: Text('Добавить', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 16.h),
        if (_additionalPhotos.isNotEmpty)
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: _additionalPhotos.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 12.w),
                  width: 150.w,
                  child: _buildPhotoItem(_additionalPhotos[index], isMain: false),
                );
              },
            ),
          )
        else
          _buildEmptyPhotoPlaceholder(isMain: false),
      ],
    );
  }

  Widget _buildPhotoItem(_PhotoItem photoItem, {required bool isMain}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Изображение занимает всё доступное пространство
          Positioned.fill(
            child: photoItem.isNew
                ? kIsWeb
                      ? photoItem.bytes != null
                            ? Image.memory(
                                photoItem.bytes!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Color(0xFFF3F4F6),
                                  child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                                ),
                              )
                            : Container(
                                color: Color(0xFFF3F4F6),
                                child: Center(child: CircularProgressIndicator()),
                              )
                      : Image.file(
                          File(photoItem.file!.path),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Color(0xFFF3F4F6),
                            child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                          ),
                        )
                : photoItem.url != null && photoItem.url!.isNotEmpty
                ? Image.network(
                    getImageUrl(photoItem.url!),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Color(0xFFF3F4F6),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Color(0xFFF3F4F6),
                      child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                    ),
                  )
                : Container(
                    color: Color(0xFFF3F4F6),
                    child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                  ),
          ),
          // Кнопка удаления
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () => _deletePhoto(photoItem, isMain: isMain),
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPhotoPlaceholder({required bool isMain}) {
    return GestureDetector(
      onTap: isMain ? _pickMainPhoto : _pickAdditionalPhotos,
      child: Container(
        height: isMain ? 200.h : 170.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, size: 40.sp, color: Color(0xFF9CA5AF)),
            SizedBox(height: 8.h),
            Flexible(
              child: Text(
                isMain ? 'Добавить основную фотографию' : 'Добавить фотографии',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickMainPhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (image != null && mounted) {
        Uint8List? bytes;
        if (kIsWeb) {
          // Для веб-платформы читаем байты сразу
          bytes = await image.readAsBytes();
        }
        if (mounted) {
          setState(() {
            _mainPhoto = _PhotoItem(url: null, file: image, isNew: true, bytes: bytes);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать фотографию: ${e.toString()}'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }

  Future<void> _pickAdditionalPhotos() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (images != null && images.isNotEmpty && mounted) {
        final List<_PhotoItem> photoItems = [];
        for (final file in images) {
          Uint8List? bytes;
          if (kIsWeb) {
            // Для веб-платформы читаем байты сразу
            bytes = await file.readAsBytes();
          }
          photoItems.add(_PhotoItem(url: null, file: file, isNew: true, bytes: bytes));
        }
        if (mounted) {
          setState(() {
            _additionalPhotos.addAll(photoItems);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать фотографии: ${e.toString()}'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }

  void _deletePhoto(_PhotoItem photoItem, {required bool isMain}) {
    if (mounted) {
      setState(() {
        if (isMain) {
          _mainPhoto = null;
        } else {
          _additionalPhotos.remove(photoItem);
        }
      });
    }
  }
}

/// Вспомогательный класс для хранения информации о фотографии
class _PhotoItem {
  final String? url;
  final XFile? file;
  final bool isNew;
  final Uint8List? bytes; // Кэшированные байты для веб-платформы

  _PhotoItem({this.url, this.file, required this.isNew, this.bytes}) : assert((url != null && !isNew) || (file != null && isNew), 'Either url or file must be provided');
}
