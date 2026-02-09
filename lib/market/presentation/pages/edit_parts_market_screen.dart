import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_edit_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/market/presentation/widgets/compatible_aircraft_models_selector.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

@RoutePage()
class EditPartsMarketScreen extends StatefulWidget {
  final int productId;

  const EditPartsMarketScreen({super.key, @PathParam('id') required this.productId});

  @override
  State<EditPartsMarketScreen> createState() => _EditPartsMarketScreenState();
}

class _EditPartsMarketScreenState extends State<EditPartsMarketScreen> {
  final _formKey = GlobalKey<FormState>();
  PartsMarketEditState?
  _previousStateBeforeLoading; // Сохраняем состояние перед loading для определения publish/unpublish
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _partNumberController;
  late final TextEditingController _oemNumberController;
  late final TextEditingController _quantityController;
  late final TextEditingController _weightKgController;
  late final TextEditingController _dimensionsLengthController;
  late final TextEditingController _dimensionsWidthController;
  late final TextEditingController _dimensionsHeightController;
  List<int> _selectedAircraftModelIds = [];
  String? _manualAircraftModelsText;

  String? _condition;
  int? _selectedMainCategoryId;
  int? _selectedSubcategoryId; // Подкатегория первого уровня (parentId == null)
  int? _selectedSubSubcategoryId; // Подкатегория второго уровня (parentId = _selectedSubcategoryId)
  int? _selectedSubSubSubcategoryId; // Подкатегория третьего уровня (parentId = _selectedSubSubcategoryId)
  int? _selectedSubSubSubSubcategoryId; // Подкатегория четвертого уровня (parentId = _selectedSubSubSubcategoryId)
  int? _selectedManufacturerId;
  String? _selectedManufacturerName;
  String? _selectedLocation;
  String _currency = 'RUB';

  // Фотографии
  _PhotoItem? _mainPhoto;
  List<_PhotoItem> _additionalPhotos = [];

  static const List<String> _validConditionValues = ['new', 'used', 'restored'];

  // Флаг админа
  bool _isAdmin = false;

  // BLoC для редактирования
  late PartsMarketEditBloc _editBloc;

  // Сохраняем productId для безопасного использования
  late final int _productId;

  @override
  void initState() {
    super.initState();
    // Сохраняем productId
    _productId = widget.productId;
    // Создаем BLoC для редактирования
    _editBloc = PartsMarketEditBloc(repository: getIt<MarketRepository>())
      ..add(PartsMarketEditEvent.getProduct(_productId));

    // Инициализируем контроллеры пустыми, заполним после загрузки данных
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _partNumberController = TextEditingController();
    _oemNumberController = TextEditingController();
    _quantityController = TextEditingController();
    _weightKgController = TextEditingController();
    _dimensionsLengthController = TextEditingController();
    _dimensionsWidthController = TextEditingController();
    _dimensionsHeightController = TextEditingController();

    // Загружаем категории для выбора
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: 'parts'));

    // Проверяем, является ли пользователь админом
    _isAdmin = PermissionHelper.isAdmin(context);
  }

  void _initializeFromProduct(PartsMarketEntity product) {
    _titleController.text = product.title;
    _descriptionController.text = product.description ?? '';
    _priceController.text = product.price.toString();
    _partNumberController.text = product.partNumber ?? '';
    _oemNumberController.text = product.oemNumber ?? '';
    _quantityController.text = product.quantity.toString();
    _weightKgController.text = product.weightKg?.toString() ?? '';
    _dimensionsLengthController.text = product.dimensionsLengthCm?.toString() ?? '';
    _dimensionsWidthController.text = product.dimensionsWidthCm?.toString() ?? '';
    _dimensionsHeightController.text = product.dimensionsHeightCm?.toString() ?? '';
    _selectedAircraftModelIds = product.compatibleAircraftModelIds ?? [];
    _manualAircraftModelsText = product.compatibleAircraftModelsText;

    _condition = product.condition != null && _validConditionValues.contains(product.condition)
        ? product.condition
        : null;
    _selectedMainCategoryId = product.partsMainCategoryId;
    _selectedSubcategoryId = product.partsSubcategoryId;
    _selectedManufacturerId = product.manufacturerId;
    _selectedManufacturerName = product.manufacturerNameDisplay ?? product.manufacturerName;
    _selectedLocation = product.location;
    _currency = product.currency;

    // Инициализируем фотографии
    if (product.mainImageUrl != null && product.mainImageUrl!.isNotEmpty) {
      _mainPhoto = _PhotoItem(url: product.mainImageUrl, file: null, bytes: null, isNew: false);
    }
    _additionalPhotos = product.additionalImageUrls
        .where((url) => url.isNotEmpty)
        .map((url) => _PhotoItem(url: url, file: null, bytes: null, isNew: false))
        .toList();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _partNumberController.dispose();
    _oemNumberController.dispose();
    _quantityController.dispose();
    _weightKgController.dispose();
    _dimensionsLengthController.dispose();
    _dimensionsWidthController.dispose();
    _dimensionsHeightController.dispose();
    _editBloc.close();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedMainCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Выберите категорию'), backgroundColor: Colors.red));
      return;
    }

    if (_selectedSubcategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Выберите подкатегорию'), backgroundColor: Colors.red));
      return;
    }

    final hasValidMainPhoto =
        _mainPhoto != null && (_mainPhoto!.isNew || (_mainPhoto!.url != null && _mainPhoto!.url!.isNotEmpty));
    if (!hasValidMainPhoto) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Добавьте основную фотографию'), backgroundColor: Colors.red));
      return;
    }

    if (_selectedManufacturerId == null &&
        (_selectedManufacturerName == null || _selectedManufacturerName!.trim().isEmpty)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Выберите производителя'), backgroundColor: Colors.red));
      return;
    }

    if (!mounted) return;

    // Получаем текущий продукт из состояния BLoC
    final currentState = _editBloc.state;
    final currentProduct = currentState.maybeWhen(
      loaded: (product) => product,
      saved: (product) => product,
      published: (product) => product,
      unpublished: (product) => product,
      orElse: () => null,
    );

    if (currentProduct == null) return;

    // Подготавливаем данные для основной фотографии
    String? mainImageUrl;
    XFile? mainImageFile;

    final hadOldMainImage = currentProduct.mainImageUrl != null && currentProduct.mainImageUrl!.isNotEmpty;

    if (_mainPhoto != null && _mainPhoto!.isNew) {
      // Новая фотография - передаем только файл, бэкенд сам заменит старую
      mainImageFile = _mainPhoto!.file;
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
    final existingAdditionalPhotos = _additionalPhotos
        .where((photo) => !photo.isNew && photo.url != null && photo.url!.isNotEmpty)
        .toList();

    // Всегда передаем существующие URL (которые не были удалены)
    additionalImageUrls.addAll(existingAdditionalPhotos.map((photo) => photo.url!));

    // Если есть новые файлы - передаем их тоже
    if (newAdditionalPhotos.isNotEmpty) {
      additionalImageFiles = newAdditionalPhotos.map((photo) => photo.file!).toList();
    }

    // Отправляем запрос на обновление товара через новый BLoC
    _editBloc.add(
      PartsMarketEditEvent.updateProduct(
        productId: currentProduct.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
        price: int.tryParse(_priceController.text.trim()) ?? currentProduct.price,
        currency: _currency,
        partsMainCategoryId: _selectedMainCategoryId,
        partsSubcategoryId:
            _selectedSubSubSubSubcategoryId ??
            _selectedSubSubSubcategoryId ??
            _selectedSubSubcategoryId ??
            _selectedSubcategoryId,
        manufacturerId: _selectedManufacturerId,
        manufacturerName: _selectedManufacturerName,
        partNumber: _partNumberController.text.trim().isEmpty ? null : _partNumberController.text.trim(),
        oemNumber: _oemNumberController.text.trim().isEmpty ? null : _oemNumberController.text.trim(),
        condition: _condition,
        quantity: int.tryParse(_quantityController.text.trim()) ?? currentProduct.quantity,
        location: _selectedLocation,
        weightKg: _weightKgController.text.trim().isEmpty ? null : double.tryParse(_weightKgController.text.trim()),
        dimensionsLengthCm: _dimensionsLengthController.text.trim().isEmpty
            ? null
            : double.tryParse(_dimensionsLengthController.text.trim()),
        dimensionsWidthCm: _dimensionsWidthController.text.trim().isEmpty
            ? null
            : double.tryParse(_dimensionsWidthController.text.trim()),
        dimensionsHeightCm: _dimensionsHeightController.text.trim().isEmpty
            ? null
            : double.tryParse(_dimensionsHeightController.text.trim()),
        compatibleAircraftModelIds: _selectedAircraftModelIds.isNotEmpty ? _selectedAircraftModelIds : null,
        compatibleAircraftModelsText: _manualAircraftModelsText?.isEmpty ?? true ? null : _manualAircraftModelsText,
        mainImageUrl: mainImageUrl,
        additionalImageUrls: additionalImageUrls,
        mainImageFile: mainImageFile,
        additionalImageFiles: additionalImageFiles,
      ),
    );
  }

  void _unpublishProduct() {
    _editBloc.add(PartsMarketEditEvent.unpublishProduct(_productId));
  }

  void _publishProduct() {
    _editBloc.add(PartsMarketEditEvent.publishProduct(_productId));
  }

  Widget _buildPublishButtons() {
    return BlocBuilder<PartsMarketEditBloc, PartsMarketEditState>(
      builder: (context, state) {
        // Получаем актуальный продукт из состояния BLoC
        final currentProduct = state.maybeWhen(
          published: (product) => product,
          unpublished: (product) => product,
          saved: (product) => product,
          loaded: (product) => product,
          orElse: () => null,
        );

        if (currentProduct == null) return const SizedBox.shrink();

        final isPublished = currentProduct.isPublished;
        final isActive = currentProduct.isActive;

        // Показываем индикатор загрузки во время публикации/снятия с публикации
        final isLoading = state.maybeWhen(publishing: () => true, unpublishing: () => true, orElse: () => false);

        return Column(
          children: [
            if (isPublished)
              CustomButton(
                title: isLoading ? 'Снятие...' : 'Снять с публикации',
                verticalPadding: 12,
                backgroundColor: Colors.red,
                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                borderColor: Colors.red,
                borderRadius: 12,
                onPressed: isLoading ? null : _unpublishProduct,
                disabled: isLoading,
              )
            else
              CustomButton(
                title: isLoading ? 'Публикация...' : 'Опубликовать',
                verticalPadding: 12,
                backgroundColor: AppColors.primary100p,
                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                borderColor: AppColors.primary100p,
                borderRadius: 12,
                onPressed: isLoading ? null : _publishProduct,
                disabled: isLoading,
              ),
            SizedBox(height: 12),
            // Кнопки для админов: Заблокировать/Разблокировать
            if (_isAdmin)
              isActive
                  ? CustomButton(
                      title: 'Заблокировать',
                      verticalPadding: 12,
                      backgroundColor: Colors.orange,
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: Colors.orange,
                      borderRadius: 12,
                      onPressed: () => _blockProduct(context),
                    )
                  : CustomButton(
                      title: 'Разблокировать',
                      verticalPadding: 12,
                      backgroundColor: Colors.green,
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: Colors.green,
                      borderRadius: 12,
                      onPressed: () => _unblockProduct(context),
                    ),
          ],
        );
      },
    );
  }

  Future<void> _blockProduct(BuildContext context) async {
    final repository = getIt<MarketRepository>();
    final result = await repository.deactivateProduct(_productId);
    result.fold(
      (failure) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(failure.message ?? 'Ошибка блокировки'), backgroundColor: Colors.red));
      },
      (product) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Объявление заблокировано'), backgroundColor: Colors.orange));
        context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
        context.router.maybePop(); // Закрываем экран редактирования
      },
    );
  }

  Future<void> _unblockProduct(BuildContext context) async {
    final repository = getIt<MarketRepository>();
    final result = await repository.activateProduct(_productId);
    result.fold(
      (failure) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(failure.message ?? 'Ошибка разблокировки'), backgroundColor: Colors.red));
      },
      (product) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Объявление разблокировано'), backgroundColor: Colors.green));
        context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
        context.router.maybePop(); // Закрываем экран редактирования
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _editBloc,
      child: MultiBlocListener(
        listeners: [
          // Слушаем PartsMarketEditBloc для сохранения
          BlocListener<PartsMarketEditBloc, PartsMarketEditState>(
            listenWhen: (previous, current) {
              return previous.maybeWhen(
                saving: () => current.maybeWhen(saved: (_) => true, error: (_) => true, orElse: () => false),
                orElse: () => false,
              );
            },
            listener: (context, state) {
              if (!mounted) return;
              state.maybeWhen(
                saved: (product) {
                  // Обновляем список в главном BLoC
                  context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Изменения сохранены'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  // Возвращаемся на детальную страницу после успешного сохранения
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      context.router.maybePop();
                    }
                  });
                },
                error: (message) {
                  // Ошибка сохранения - показываем snackbar, остаемся на экране
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
          // Слушаем PartsMarketEditBloc для publish/unpublish операций
          BlocListener<PartsMarketEditBloc, PartsMarketEditState>(
            listenWhen: (previous, current) {
              // Реагируем на published/unpublished
              final isPublishing = previous.maybeWhen(publishing: () => true, orElse: () => false);
              if (isPublishing) {
                return current.maybeWhen(published: (_) => true, error: (_) => true, orElse: () => false);
              }
              final isUnpublishing = previous.maybeWhen(unpublishing: () => true, orElse: () => false);
              if (isUnpublishing) {
                return current.maybeWhen(unpublished: (_) => true, error: (_) => true, orElse: () => false);
              }
              // Сохраняем состояние перед loading (когда вызываем getProduct после publish/unpublish)
              final wasPublishedOrUnpublished = previous.maybeWhen(
                published: (_) => true,
                unpublished: (_) => true,
                orElse: () => false,
              );
              if (wasPublishedOrUnpublished) {
                final isNowLoading = current.maybeWhen(loading: () => true, orElse: () => false);
                if (isNowLoading) {
                  _previousStateBeforeLoading = previous;
                  return false; // Не обрабатываем здесь, ждем loaded
                }
              }
              // Реагируем на loaded после loading, если перед loading было published/unpublished
              final wasLoading = previous.maybeWhen(loading: () => true, orElse: () => false);
              if (wasLoading && _previousStateBeforeLoading != null) {
                return current.maybeWhen(loaded: (_) => true, error: (_) => true, orElse: () => false);
              }
              return false;
            },
            listener: (context, state) {
              if (!mounted) return;
              state.maybeWhen(
                published: (product) {
                  // Обновляем список в главном BLoC
                  context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  // Запрашиваем обновленный продукт с сервера для обновления формы
                  _editBloc.add(PartsMarketEditEvent.getProduct(_productId));
                },
                unpublished: (product) {
                  // Обновляем список в главном BLoC
                  context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  // Запрашиваем обновленный продукт с сервера для обновления формы
                  _editBloc.add(PartsMarketEditEvent.getProduct(_productId));
                },
                loaded: (product) {
                  // Проверяем, что это обновление после publish/unpublish
                  if (_previousStateBeforeLoading != null) {
                    final wasPublished = _previousStateBeforeLoading is PublishedPartsMarketEditState;
                    final wasUnpublished = _previousStateBeforeLoading is UnpublishedPartsMarketEditState;
                    if (wasPublished || wasUnpublished) {
                      // Показываем сообщение только после получения обновленного состояния
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            product.isPublished ? 'Объявление опубликовано' : 'Объявление снято с публикации',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      _previousStateBeforeLoading = null; // Сбрасываем после использования
                      // Возвращаемся на детальную страницу после успешного publish/unpublish
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          context.router.maybePop();
                        }
                      });
                    }
                  }
                },
                error: (message) {
                  _previousStateBeforeLoading = null; // Сбрасываем при ошибке
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Редактирование',
            withBack: true,
            actions: [
              BlocBuilder<PartsMarketEditBloc, PartsMarketEditState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(saving: () => true, orElse: () => false);
                  return TextButton(
                    onPressed: isLoading ? null : _saveChanges,
                    child: isLoading
                        ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : Text('Сохранить', style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
                  );
                },
              ),
            ],
          ),
          backgroundColor: AppColors.background,
          body: BlocBuilder<PartsMarketEditBloc, PartsMarketEditState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: LoadingCustom()),
                loading: () => const Center(child: LoadingCustom()),
                loaded: (product) {
                  // Инициализируем форму при первой загрузке
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted && _titleController.text.isEmpty) {
                      _initializeFromProduct(product);
                      // Загружаем подкатегории если нужно
                      if (_selectedMainCategoryId != null) {
                        context.read<MarketCategoriesBloc>().add(
                          MarketCategoriesEvent.getSubcategories(
                            productType: 'parts',
                            mainCategoryId: _selectedMainCategoryId,
                          ),
                        );
                      }
                    }
                  });
                  return _buildForm();
                },
                saved: (_) => _buildForm(),
                published: (_) => _buildForm(),
                unpublished: (_) => _buildForm(),
                error: (message) => Center(
                  child: ErrorCustom(
                    textError: message,
                    repeat: () => _editBloc.add(PartsMarketEditEvent.getProduct(_productId)),
                  ),
                ),
                saving: () => const Center(child: LoadingCustom()),
                deleting: () => const Center(child: LoadingCustom()),
                deleted: (_) => const Center(child: Text('Товар удален')),
                publishing: () => const Center(child: LoadingCustom()),
                unpublishing: () => const Center(child: LoadingCustom()),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMainPhotoSection(),
            SizedBox(height: 16),
            _buildAdditionalPhotosSection(),
            SizedBox(height: 16),
            _buildMainCategoryDropdown(),
            SizedBox(height: 16),
            if (_selectedMainCategoryId != null) _buildSubcategoryDropdown(),
            SizedBox(height: 16),
            if (_selectedSubcategoryId != null) _buildSubSubcategoryDropdown(),
            SizedBox(height: 16),
            if (_selectedSubSubSubcategoryId != null) _buildSubSubSubcategoryDropdown(),
            SizedBox(height: 16),
            if (_selectedSubSubSubSubcategoryId != null) _buildSubSubSubSubcategoryDropdown(),
            SizedBox(height: 16),
            _buildManufacturerField(),
            SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Название *',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите название запчасти';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Цена *',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: 90,
                  child: DropdownButtonFormField<String>(
                    value: _currency,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    items: [
                      'RUB',
                      'USD',
                      'EUR',
                    ].map((currency) => DropdownMenuItem(value: currency, child: Text(currency))).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _currency = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _partNumberController,
              decoration: InputDecoration(
                labelText: 'Артикул',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _oemNumberController,
              decoration: InputDecoration(
                labelText: 'OEM номер',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            _buildConditionField(),
            SizedBox(height: 16),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Количество',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            LocationPickerWidget(
              initialLocation: _selectedLocation,
              onLocationSelected: (locationData) {
                setState(() {
                  _selectedLocation = locationData['address'] as String?;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _weightKgController,
              decoration: InputDecoration(
                labelText: 'Вес (кг)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dimensionsLengthController,
                    decoration: InputDecoration(
                      labelText: 'Длина (см)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _dimensionsWidthController,
                    decoration: InputDecoration(
                      labelText: 'Ширина (см)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _dimensionsHeightController,
                    decoration: InputDecoration(
                      labelText: 'Высота (см)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CompatibleAircraftModelsSelector(
              initialSelectedModelIds: _selectedAircraftModelIds,
              initialManualText: _manualAircraftModelsText,
              onSelectedModelsChanged: (List<int> ids) {
                setState(() {
                  _selectedAircraftModelIds = ids;
                });
              },
              onManualTextChanged: (String? text) {
                setState(() {
                  _manualAircraftModelsText = text;
                });
              },
            ),
            SizedBox(height: 16),
            _buildPublishButtons(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCategoryDropdown() {
    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (categories) {
            if (categories.isEmpty) {
              return const SizedBox.shrink();
            }
            return _buildMainCategoryField(categories);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildMainCategoryField(List<MarketCategoryEntity> categories) {
    final selectedCategory = _selectedMainCategoryId != null
        ? categories.firstWhere((category) => category.id == _selectedMainCategoryId, orElse: () => categories.first)
        : null;
    final displayText = _selectedMainCategoryId != null ? selectedCategory!.name : 'Выберите категорию';

    return InkWell(
      onTap: () => _showMainCategoryBottomSheet(categories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Категория *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedMainCategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildSubcategoryDropdown() {
    if (_selectedMainCategoryId == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (categories) {
            // Фильтруем подкатегории: они должны иметь partsMainCategoryId равный выбранной главной категории
            // И parentId должен быть null (это подкатегории, а не под-подкатегории)
            final subcategories = categories
                .where((c) => c.partsMainCategoryId == _selectedMainCategoryId && c.parentId == null)
                .toList();

            // Если подкатегорий нет, не показываем ничего
            if (subcategories.isEmpty) {
              return const SizedBox.shrink();
            }
            return _buildSubcategoryField(subcategories);
          },
          loading: () {
            // Показываем индикатор загрузки при загрузке подкатегорий
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSubcategoryField(List<MarketCategoryEntity> subcategories) {
    final selectedSubcategory = _selectedSubcategoryId != null
        ? subcategories.firstWhere(
            (category) => category.id == _selectedSubcategoryId,
            orElse: () => subcategories.first,
          )
        : null;
    final displayText = _selectedSubcategoryId != null ? selectedSubcategory!.name : 'Выберите подкатегорию *';

    return InkWell(
      onTap: () => _showSubcategoryBottomSheet(subcategories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Подкатегория *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedSubcategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildManufacturerField() {
    final displayText = _selectedManufacturerName ?? 'Выберите производителя *';

    return InkWell(
      onTap: () => _showManufacturerBottomSheet(),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Производитель *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedManufacturerName != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildConditionField() {
    String displayText = 'Выберите состояние';
    if (_condition != null) {
      switch (_condition) {
        case 'new':
          displayText = 'Новое';
          break;
        case 'used':
          displayText = 'Б/у';
          break;
        case 'restored':
          displayText = 'Восстановленное';
          break;
      }
    }

    return InkWell(
      onTap: () => _showConditionBottomSheet(),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Состояние',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _condition != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildMainPhotoSection() {
    final hasValidPhoto =
        _mainPhoto != null && (_mainPhoto!.isNew || (_mainPhoto!.url != null && _mainPhoto!.url!.isNotEmpty));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Основная фотография', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
        SizedBox(height: 12),
        if (hasValidPhoto)
          SizedBox(height: 200, child: _buildPhotoItem(_mainPhoto!, isMain: true))
        else
          _buildEmptyPhotoPlaceholder(isMain: true),
      ],
    );
  }

  Widget _buildAdditionalPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Дополнительные фотографии', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
        SizedBox(height: 12),
        if (_additionalPhotos.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemCount: _additionalPhotos.length,
            itemBuilder: (context, index) {
              return _buildPhotoItem(_additionalPhotos[index], isMain: false);
            },
          )
        else
          _buildEmptyPhotoPlaceholder(isMain: false),
      ],
    );
  }

  Widget _buildPhotoItem(_PhotoItem photoItem, {required bool isMain}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Изображение без Positioned.fill, чтобы избежать проблем с parentData
          photoItem.isNew
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
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _deletePhoto(photoItem, isMain: isMain),
              child: Container(
                padding: EdgeInsets.all(6),
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
    return InkWell(
      onTap: isMain ? _pickMainPhoto : _pickAdditionalPhotos,
      child: Container(
        height: isMain ? 200 : 150,
        decoration: BoxDecoration(
          color: Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB), style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, size: 48, color: Color(0xFF9CA5AF)),
            SizedBox(height: 8),
            Text(
              isMain ? 'Добавить основное фото' : 'Добавить фото',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickMainPhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (image != null && mounted) {
        Uint8List? bytes;
        if (kIsWeb) {
          bytes = await image.readAsBytes();
        }

        setState(() {
          _mainPhoto = _PhotoItem(file: image, url: null, bytes: bytes, isNew: true);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось выбрать фотографию: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
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
            bytes = await file.readAsBytes();
          }
          photoItems.add(_PhotoItem(file: file, url: null, bytes: bytes, isNew: true));
        }
        if (mounted) {
          setState(() {
            _additionalPhotos.addAll(photoItems);
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось выбрать фотографии: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _deletePhoto(_PhotoItem photoItem, {required bool isMain}) {
    setState(() {
      if (isMain) {
        _mainPhoto = null;
      } else {
        _additionalPhotos.remove(photoItem);
      }
    });
  }

  Future<void> _showMainCategoryBottomSheet(List<MarketCategoryEntity> categories) async {
    await showUniversalBottomSheet<int>(
      context: context,
      title: 'Выберите категорию',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedMainCategoryId == category.id;
          return ListTile(
            title: Text(category.name, style: AppStyles.regular14s),
            trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
            selected: isSelected,
            onTap: () async {
              debugPrint('🔵 Выбрана главная категория: ${category.id} (${category.name})');
              setState(() {
                _selectedMainCategoryId = category.id;
                _selectedSubcategoryId = null;
                _selectedSubSubcategoryId = null; // Сбрасываем суб-подкатегорию при смене главной
              });
              // Закрываем bottom sheet сначала
              Navigator.pop(context, category.id);
              // Затем загружаем подкатегории для выбранной главной категории
              debugPrint('🔵 Загружаем подкатегории для mainCategoryId=${category.id}');
              context.read<MarketCategoriesBloc>().add(
                MarketCategoriesEvent.getSubcategories(productType: 'parts', mainCategoryId: category.id),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showSubcategoryBottomSheet(List<MarketCategoryEntity> subcategories) async {
    final result = await showUniversalBottomSheet<int>(
      context: context,
      title: 'Выберите подкатегорию *',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final category = subcategories[index];
          final isSelected = _selectedSubcategoryId == category.id;
          return ListTile(
            title: Text(category.name, style: AppStyles.regular14s),
            trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
            selected: isSelected,
            onTap: () {
              setState(() {
                _selectedSubcategoryId = category.id;
              });
              // Закрываем только bottom sheet, не весь экран
              if (Navigator.canPop(context)) {
                Navigator.pop(context, category.id);
              }
            },
          );
        },
      ),
    );
    // Результат уже обработан в setState выше, но можно использовать для дополнительной логики
    if (result != null && result != _selectedSubcategoryId) {
      setState(() {
        _selectedSubcategoryId = result;
        _selectedSubSubcategoryId = null; // Сбрасываем суб-подкатегорию при смене подкатегории
      });
      // Загружаем суб-подкатегории для выбранной подкатегории
      debugPrint('🔵 Загружаем суб-подкатегории для subcategoryId=${result}');
      context.read<MarketCategoriesBloc>().add(
        MarketCategoriesEvent.getSubcategories(
          productType: 'parts',
          parentId: result,
          mainCategoryId: _selectedMainCategoryId,
        ),
      );
    }
  }

  Widget _buildSubSubcategoryDropdown() {
    if (_selectedSubcategoryId == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        debugPrint('🔵 _buildSubSubcategoryDropdown: _selectedSubcategoryId=$_selectedSubcategoryId, state=$state');
        return state.maybeWhen(
          success: (categories) {
            // Фильтруем суб-подкатегории: они должны иметь parentId равный выбранной подкатегории
            final subSubcategories = categories.where((c) => c.parentId == _selectedSubcategoryId).toList();
            debugPrint(
              '🔵 Найдено суб-подкатегорий для subcategoryId=$_selectedSubcategoryId: ${subSubcategories.length}',
            );

            // Если суб-подкатегорий нет, не показываем ничего
            if (subSubcategories.isEmpty) {
              debugPrint('🔵 Суб-подкатегорий нет, скрываем поле');
              return const SizedBox.shrink();
            }
            debugPrint('🔵 Отображаем поле суб-подкатегорий с ${subSubcategories.length} элементами');
            return _buildSubSubcategoryField(subSubcategories);
          },
          loading: () {
            debugPrint('🔵 Загрузка суб-подкатегорий...');
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          orElse: () {
            debugPrint('🔵 Состояние не success и не loading: $state');
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _buildSubSubcategoryField(List<MarketCategoryEntity> subSubcategories) {
    final selectedSubSubcategory = _selectedSubSubcategoryId != null
        ? subSubcategories.firstWhere(
            (category) => category.id == _selectedSubSubcategoryId,
            orElse: () => subSubcategories.first,
          )
        : null;
    final displayText = _selectedSubSubcategoryId != null
        ? selectedSubSubcategory!.name
        : 'Выберите суб-подкатегорию (необязательно)';

    return InkWell(
      onTap: () => _showSubSubcategoryBottomSheet(subSubcategories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Суб-подкатегория',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedSubSubcategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Future<void> _showSubSubcategoryBottomSheet(List<MarketCategoryEntity> subSubcategories) async {
    final result = await showUniversalBottomSheet<int?>(
      context: context,
      title: 'Выберите суб-подкатегорию',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text('Не выбрано', style: AppStyles.regular14s),
            trailing: _selectedSubSubcategoryId == null ? Icon(Icons.check, color: AppColors.primary100p) : null,
            onTap: () {
              setState(() {
                _selectedSubSubcategoryId = null;
              });
              if (Navigator.canPop(context)) {
                Navigator.pop(context, null);
              }
            },
          ),
          ...subSubcategories.map((category) {
            final isSelected = _selectedSubSubcategoryId == category.id;
            return ListTile(
              title: Text(category.name, style: AppStyles.regular14s),
              trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
              selected: isSelected,
              onTap: () {
                setState(() {
                  _selectedSubSubcategoryId = category.id;
                });
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, category.id);
                }
              },
            );
          }),
        ],
      ),
    );
    if (result != null && result != _selectedSubSubcategoryId) {
      setState(() {
        _selectedSubSubcategoryId = result;
        _selectedSubSubSubcategoryId =
            null; // Сбрасываем подкатегорию третьего уровня при смене подкатегории второго уровня
        _selectedSubSubSubSubcategoryId =
            null; // Сбрасываем подкатегорию четвертого уровня при смене подкатегории второго уровня
      });
      // Загружаем подкатегории третьего уровня для выбранной подкатегории второго уровня
      debugPrint('🔵 Загружаем подкатегории третьего уровня для subSubcategoryId=${result}');
      context.read<MarketCategoriesBloc>().add(
        MarketCategoriesEvent.getSubcategories(
          productType: 'parts',
          parentId: result,
          mainCategoryId: _selectedMainCategoryId,
        ),
      );
    }
  }

  Widget _buildSubSubSubcategoryDropdown() {
    if (_selectedSubSubcategoryId == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        debugPrint(
          '🔵 _buildSubSubSubcategoryDropdown: _selectedSubSubcategoryId=$_selectedSubSubcategoryId, state=$state',
        );
        return state.maybeWhen(
          success: (categories) {
            // Фильтруем подкатегории третьего уровня: они должны иметь parentId равный выбранной подкатегории второго уровня
            final subSubSubcategories = categories.where((c) => c.parentId == _selectedSubSubcategoryId).toList();
            debugPrint(
              '🔵 Найдено подкатегорий третьего уровня для subSubcategoryId=$_selectedSubSubcategoryId: ${subSubSubcategories.length}',
            );

            // Если подкатегорий третьего уровня нет, не показываем ничего
            if (subSubSubcategories.isEmpty) {
              debugPrint('🔵 Подкатегорий третьего уровня нет, скрываем поле');
              return const SizedBox.shrink();
            }
            debugPrint('🔵 Отображаем поле подкатегорий третьего уровня с ${subSubSubcategories.length} элементами');
            return _buildSubSubSubcategoryField(subSubSubcategories);
          },
          loading: () {
            debugPrint('🔵 Загрузка подкатегорий третьего уровня...');
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          orElse: () {
            debugPrint('🔵 Состояние не success и не loading: $state');
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _buildSubSubSubcategoryField(List<MarketCategoryEntity> subSubSubcategories) {
    final selectedSubSubSubcategory = _selectedSubSubSubcategoryId != null
        ? subSubSubcategories.firstWhere(
            (category) => category.id == _selectedSubSubSubcategoryId,
            orElse: () => subSubSubcategories.first,
          )
        : null;
    final displayText = _selectedSubSubSubcategoryId != null
        ? selectedSubSubSubcategory!.name
        : 'Выберите подкатегорию третьего уровня (необязательно)';

    return InkWell(
      onTap: () => _showSubSubSubcategoryBottomSheet(subSubSubcategories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Подкатегория третьего уровня',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedSubSubSubcategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Future<void> _showSubSubSubcategoryBottomSheet(List<MarketCategoryEntity> subSubSubcategories) async {
    final result = await showUniversalBottomSheet<int?>(
      context: context,
      title: 'Выберите подкатегорию третьего уровня',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text('Не выбрано', style: AppStyles.regular14s),
            trailing: _selectedSubSubSubcategoryId == null ? Icon(Icons.check, color: AppColors.primary100p) : null,
            onTap: () {
              setState(() {
                _selectedSubSubSubcategoryId = null;
              });
              if (Navigator.canPop(context)) {
                Navigator.pop(context, null);
              }
            },
          ),
          ...subSubSubcategories.map((category) {
            final isSelected = _selectedSubSubSubcategoryId == category.id;
            return ListTile(
              title: Text(category.name, style: AppStyles.regular14s),
              trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
              selected: isSelected,
              onTap: () {
                setState(() {
                  _selectedSubSubSubcategoryId = category.id;
                });
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, category.id);
                }
              },
            );
          }),
        ],
      ),
    );
    if (result != null && result != _selectedSubSubSubcategoryId) {
      debugPrint('🔵 Выбрана подкатегория третьего уровня: id=${result}');
      setState(() {
        _selectedSubSubSubcategoryId = result;
        _selectedSubSubSubSubcategoryId =
            null; // Сбрасываем подкатегорию четвертого уровня при смене подкатегории третьего уровня
      });
      // Загружаем подкатегории четвертого уровня для выбранной подкатегории третьего уровня
      debugPrint(
        '🔵 Загружаем подкатегории четвертого уровня для subSubSubcategoryId=${result}, mainCategoryId=${_selectedMainCategoryId}',
      );
      context.read<MarketCategoriesBloc>().add(
        MarketCategoriesEvent.getSubcategories(
          productType: 'parts',
          parentId: result,
          mainCategoryId: _selectedMainCategoryId,
        ),
      );
    }
  }

  Widget _buildSubSubSubSubcategoryDropdown() {
    if (_selectedSubSubSubcategoryId == null) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        debugPrint(
          '🔵 _buildSubSubSubSubcategoryDropdown: _selectedSubSubSubcategoryId=$_selectedSubSubSubcategoryId, state=$state',
        );
        return state.maybeWhen(
          success: (categories) {
            debugPrint('🔵 _buildSubSubSubSubcategoryDropdown: Все категории в состоянии: ${categories.length}');
            debugPrint(
              '🔵 _buildSubSubSubSubcategoryDropdown: Категории: ${categories.map((c) => 'id=${c.id}, name=${c.name}, parentId=${c.parentId}, partsMainCategoryId=${c.partsMainCategoryId}').join(', ')}',
            );
            debugPrint(
              '🔵 _buildSubSubSubSubcategoryDropdown: Ищем категории с parentId=$_selectedSubSubSubcategoryId',
            );
            // Фильтруем подкатегории четвертого уровня: они должны иметь parentId равный выбранной подкатегории третьего уровня
            final subSubSubSubcategories = categories.where((c) => c.parentId == _selectedSubSubSubcategoryId).toList();
            debugPrint(
              '🔵 Найдено подкатегорий четвертого уровня для subSubSubcategoryId=$_selectedSubSubSubcategoryId: ${subSubSubSubcategories.length}',
            );
            if (subSubSubSubcategories.isNotEmpty) {
              debugPrint(
                '🔵 Подкатегории четвертого уровня: ${subSubSubSubcategories.map((c) => 'id=${c.id}, name=${c.name}').join(', ')}',
              );
            }

            // Если подкатегорий четвертого уровня нет, не показываем ничего
            if (subSubSubSubcategories.isEmpty) {
              debugPrint('🔵 Подкатегорий четвертого уровня нет, скрываем поле');
              return const SizedBox.shrink();
            }
            debugPrint(
              '🔵 Отображаем поле подкатегорий четвертого уровня с ${subSubSubSubcategories.length} элементами',
            );
            return _buildSubSubSubSubcategoryField(subSubSubSubcategories);
          },
          loading: () {
            debugPrint('🔵 Загрузка подкатегорий четвертого уровня...');
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: CircularProgressIndicator()),
            );
          },
          orElse: () {
            debugPrint('🔵 Состояние не success и не loading: $state');
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget _buildSubSubSubSubcategoryField(List<MarketCategoryEntity> subSubSubSubcategories) {
    final selectedSubSubSubSubcategory = _selectedSubSubSubSubcategoryId != null
        ? subSubSubSubcategories.firstWhere(
            (category) => category.id == _selectedSubSubSubSubcategoryId,
            orElse: () => subSubSubSubcategories.first,
          )
        : null;
    final displayText = _selectedSubSubSubSubcategoryId != null
        ? selectedSubSubSubSubcategory!.name
        : 'Выберите подкатегорию четвертого уровня (необязательно)';

    return InkWell(
      onTap: () => _showSubSubSubSubcategoryBottomSheet(subSubSubSubcategories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Подкатегория четвертого уровня',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: _selectedSubSubSubSubcategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Future<void> _showSubSubSubSubcategoryBottomSheet(List<MarketCategoryEntity> subSubSubSubcategories) async {
    final result = await showUniversalBottomSheet<int?>(
      context: context,
      title: 'Выберите подкатегорию четвертого уровня',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      useRootNavigator: false, // Используем локальный navigator, а не root
      child: Builder(
        builder: (bottomSheetContext) {
          return ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Не выбрано', style: AppStyles.regular14s),
                trailing: _selectedSubSubSubSubcategoryId == null
                    ? Icon(Icons.check, color: AppColors.primary100p)
                    : null,
                onTap: () {
                  // Закрываем только bottom sheet, используя контекст bottom sheet
                  Navigator.pop(bottomSheetContext, null);
                },
              ),
              ...subSubSubSubcategories.map((category) {
                final isSelected = _selectedSubSubSubSubcategoryId == category.id;
                return ListTile(
                  title: Text(category.name, style: AppStyles.regular14s),
                  trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
                  selected: isSelected,
                  onTap: () {
                    // Закрываем только bottom sheet, используя контекст bottom sheet
                    Navigator.pop(bottomSheetContext, category.id);
                  },
                );
              }),
            ],
          );
        },
      ),
    );
    // Обрабатываем результат выбора подкатегории четвертого уровня
    if (result != null) {
      setState(() {
        _selectedSubSubSubSubcategoryId = result;
      });
    } else if (result == null && _selectedSubSubSubSubcategoryId != null) {
      // Если выбрано "Не выбрано", сбрасываем подкатегорию четвертого уровня
      setState(() {
        _selectedSubSubSubSubcategoryId = null;
      });
    }
  }

  Future<void> _showManufacturerBottomSheet() async {
    final repository = getIt<MarketRepository>();
    final manufacturersResult = await repository.getPartsManufacturers();

    await showUniversalBottomSheet<Map<String, dynamic>?>(
      context: context,
      title: 'Выберите производителя',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: manufacturersResult.fold(
        (failure) => Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Ошибка загрузки: ${failure.message ?? "Неизвестная ошибка"}', style: AppStyles.regular14s),
          ),
        ),
        (manufacturers) => ListView(
          shrinkWrap: true,
          children: [
            ...manufacturers.map((manufacturer) {
              final manufacturerId = manufacturer['id'] as int?;
              final manufacturerName = manufacturer['name'] as String?;
              final isSelected = _selectedManufacturerId == manufacturerId;
              return ListTile(
                title: Text(manufacturerName ?? 'Без названия', style: AppStyles.regular14s),
                trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
                selected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedManufacturerId = manufacturerId;
                    _selectedManufacturerName = manufacturerName;
                  });
                  Navigator.pop(context, {'id': manufacturerId, 'name': manufacturerName});
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _showConditionBottomSheet() async {
    final conditions = [
      {'value': 'new', 'label': 'Новое'},
      {'value': 'used', 'label': 'Б/у'},
      {'value': 'restored', 'label': 'Восстановленное'},
    ];

    await showUniversalBottomSheet<String?>(
      context: context,
      title: 'Выберите состояние',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text('Не выбрано', style: AppStyles.regular14s),
            trailing: _condition == null ? Icon(Icons.check, color: AppColors.primary100p) : null,
            onTap: () {
              setState(() {
                _condition = null;
              });
              Navigator.pop(context, null);
            },
          ),
          ...conditions.map((condition) {
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
          }),
        ],
      ),
    );
  }
}

class _PhotoItem {
  final XFile? file;
  final String? url;
  final Uint8List? bytes;
  final bool isNew;

  _PhotoItem({this.file, this.url, this.bytes, required this.isNew});
}
