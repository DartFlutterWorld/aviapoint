import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/presentation/widgets/location_picker_widget.dart';
import 'package:aviapoint/market/presentation/widgets/compatible_aircraft_models_selector.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

@RoutePage()
class CreatePartsMarketScreen extends StatefulWidget {
  const CreatePartsMarketScreen({super.key});

  @override
  State<CreatePartsMarketScreen> createState() => _CreatePartsMarketScreenState();
}

class _CreatePartsMarketScreenState extends State<CreatePartsMarketScreen> {
  final _formKey = GlobalKey<FormState>();
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
  // Список выбранных категорий по уровням: [категория 1-го уровня, категория 2-го уровня, ...]
  List<int> _selectedCategoryLevels = [];
  int? _selectedManufacturerId;
  String? _selectedManufacturerName;
  String? _selectedLocation;
  String _currency = 'RUB';

  // Фотографии
  _PhotoItem? _mainPhoto;
  List<_PhotoItem> _additionalPhotos = [];

  bool _shouldCheckProfileAfterCreation = false;
  bool _shouldPublish = true; // По умолчанию публикуем объявление

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _partNumberController = TextEditingController();
    _oemNumberController = TextEditingController();
    _quantityController = TextEditingController(text: '1');
    _weightKgController = TextEditingController();
    _dimensionsLengthController = TextEditingController();
    _dimensionsWidthController = TextEditingController();
    _dimensionsHeightController = TextEditingController();

    // Загружаем категории для выбора
    context.read<MarketCategoriesBloc>().add(MarketCategoriesEvent.getMainCategories(productType: 'parts'));
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
    super.dispose();
  }

  Future<void> _createPart() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedMainCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Выберите категорию 1-го уровня'), backgroundColor: Colors.red));
      return;
    }

    // Проверяем, что выбраны все доступные уровни категорий
    // Получаем состояние категорий из BLoC
    final categoriesState = context.read<MarketCategoriesBloc>().state;
    if (categoriesState is SuccessMarketCategoriesState) {
      final categories = categoriesState.categories;

      // Проверяем наличие категорий 2-го уровня
      final level2Categories = categories
          .where((c) => c.partsMainCategoryId == _selectedMainCategoryId && c.parentId == null)
          .toList();

      if (level2Categories.isNotEmpty && _selectedCategoryLevels.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Выберите категорию 2-го уровня'), backgroundColor: Colors.red));
        return;
      }

      // Проверяем наличие категорий для каждого выбранного уровня
      for (int i = 0; i < _selectedCategoryLevels.length; i++) {
        final currentLevelId = _selectedCategoryLevels[i];
        final nextLevel = i + 3; // level 2 -> index 0, level 3 -> index 1, etc.

        // Ищем категории следующего уровня
        final nextLevelCategories = categories.where((c) => c.parentId == currentLevelId).toList();

        // Если есть категории следующего уровня, но они не выбраны
        if (nextLevelCategories.isNotEmpty && (i + 1 >= _selectedCategoryLevels.length)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Выберите категорию $nextLevel-го уровня'), backgroundColor: Colors.red),
          );
          return;
        }
      }
    }

    if (_mainPhoto == null || !_mainPhoto!.isNew) {
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

    final bloc = context.read<PartsMarketBloc>();

    XFile? mainImageFile;
    if (_mainPhoto != null && _mainPhoto!.isNew) {
      mainImageFile = _mainPhoto!.file;
    }

    List<XFile>? additionalImageFiles;
    final newAdditionalPhotos = _additionalPhotos.where((photo) => photo.isNew).toList();
    if (newAdditionalPhotos.isNotEmpty) {
      additionalImageFiles = newAdditionalPhotos.map((photo) => photo.file!).toList();
    }

    bloc.add(
      PartsMarketEvent.createPart(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        price: int.parse(_priceController.text.trim()),
        currency: _currency,
        partsMainCategoryId: _selectedMainCategoryId,
        partsSubcategoryId: _selectedCategoryLevels.isNotEmpty
            ? _selectedCategoryLevels.last
            : null, // Используем самую глубокую выбранную категорию
        manufacturerId: _selectedManufacturerId,
        manufacturerName: _selectedManufacturerName,
        partNumber: _partNumberController.text.trim().isEmpty ? null : _partNumberController.text.trim(),
        oemNumber: _oemNumberController.text.trim().isEmpty ? null : _oemNumberController.text.trim(),
        condition: _condition,
        quantity: int.tryParse(_quantityController.text.trim()) ?? 1,
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
        mainImageFile: mainImageFile,
        additionalImageFiles: additionalImageFiles,
        isPublished: _shouldPublish,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PartsMarketBloc, PartsMarketState>(
          listenWhen: (previous, current) {
            if (previous is CreatingPartsMarketState) {
              return current is CreatedPartsMarketState || current is ErrorPartsMarketState;
            }
            return false;
          },
          listener: (context, state) {
            if (!mounted) return;

            state.when(
              loading: () {},
              loadingMore: (parts) {},
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) async {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
              },
              success: (parts, hasMore) {},
              creatingPart: () {},
              createdPart: (part) async {
                final currentPath = context.router.currentPath;
                final isFromMarket = currentPath.contains('/market');

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Объявление успешно создано'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );

                final profileCheckResult = checkProfileDataComplete(context);
                if (profileCheckResult == null) {
                  _shouldCheckProfileAfterCreation = true;
                }

                if (profileCheckResult == false) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Future.delayed(Duration(milliseconds: 500), () {
                      final rootContext = navigatorKey.currentContext;
                      if (rootContext != null && rootContext.mounted) {
                        openProfileEdit(context: rootContext);
                        ScaffoldMessenger.of(rootContext).showSnackBar(
                          SnackBar(
                            content: Text('Заполните профиль чтоб с вами могли связаться'),
                            backgroundColor: Colors.orange,
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    });
                  });
                }

                if (isFromMarket) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) {
                      context.router.maybePop();
                    }
                  });
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context.mounted) {
                      context.router.maybePop();
                    }
                  });
                }
              },
              updating: () {},
              updated: (part) {},
            );
          },
        ),
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) {
            if (_shouldCheckProfileAfterCreation && current is SuccessProfileState) {
              return true;
            }
            return false;
          },
          listener: (context, profileState) {
            if (!mounted) return;
            if (_shouldCheckProfileAfterCreation) {
              _shouldCheckProfileAfterCreation = false;
              checkDataProfileAndOpenEditIfNeeded(
                context: context,
                message: 'Заполните профиль чтоб с вами могли связаться',
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Создать объявление',
          withBack: true,
          actions: [
            BlocBuilder<PartsMarketBloc, PartsMarketState>(
              builder: (context, state) {
                final isLoading = state is CreatingPartsMarketState;
                return TextButton(
                  onPressed: isLoading ? null : _createPart,
                  child: isLoading
                      ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : Text('Создать', style: AppStyles.bold16s.copyWith(color: AppColors.primary100p)),
                );
              },
            ),
          ],
        ),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                // Динамически отображаем поля для всех уровней категорий
                ..._buildCategoryLevelDropdowns(),
                SizedBox(height: 16),
                _buildManufacturerField(),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _titleController,
                  labelText: 'Название запчасти *',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введите название запчасти';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(controller: _descriptionController, labelText: 'Описание запчасти', maxLines: 4),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _priceController,
                        labelText: 'Цена *',
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
                      width: 100,
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
                CustomTextField(controller: _partNumberController, labelText: 'Артикул (если вы магазин)'),
                SizedBox(height: 16),
                CustomTextField(controller: _oemNumberController, labelText: 'OEM номер'),
                SizedBox(height: 16),
                _buildConditionField(),
                SizedBox(height: 16),
                CustomTextField(
                  controller: _quantityController,
                  labelText: 'Количество',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.trim().isNotEmpty) {
                      final quantity = int.tryParse(value.trim());
                      if (quantity == null || quantity <= 0) {
                        return 'Введите корректное количество';
                      }
                    }
                    return null;
                  },
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
                CustomTextField(
                  controller: _weightKgController,
                  labelText: 'Вес (кг)',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _dimensionsLengthController,
                        labelText: 'Длина (см)',
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: _dimensionsWidthController,
                        labelText: 'Ширина (см)',
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: _dimensionsHeightController,
                        labelText: 'Высота (см)',
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
                SizedBox(height: 24),
                // Чекбокс для выбора публикации
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.strokeForDarkArea),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _shouldPublish,
                        onChanged: (value) {
                          setState(() {
                            _shouldPublish = value ?? true;
                          });
                        },
                        activeColor: AppColors.primary100p,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Опубликовать объявление',
                              style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary),
                            ),
                            SizedBox(height: 4),
                            Text(
                              _shouldPublish
                                  ? 'Объявление будет видно всем пользователям'
                                  : 'Объявление будет сохранено как черновик',
                              style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                BlocBuilder<PartsMarketBloc, PartsMarketState>(
                  builder: (context, state) {
                    final isLoading = state is CreatingPartsMarketState;
                    return CustomButton(
                      title: isLoading ? 'Создание...' : 'Создать',
                      verticalPadding: 12,
                      backgroundColor: AppColors.primary100p,
                      textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                      borderColor: AppColors.primary100p,
                      borderRadius: 12,
                      onPressed: isLoading ? null : _createPart,
                      disabled: isLoading,
                    );
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
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
    final displayText = _selectedMainCategoryId != null ? selectedCategory!.name : 'Выберите категорию 1-го уровня';

    return InkWell(
      onTap: () => _showMainCategoryBottomSheet(categories),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Категория 1-го уровня *',
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

  /// Динамически создает поля для всех уровней категорий
  List<Widget> _buildCategoryLevelDropdowns() {
    if (_selectedMainCategoryId == null) {
      return [];
    }

    final widgets = <Widget>[];

    // Создаем поле для каждого уровня категорий (начиная с 2-го уровня, так как 1-й - это главная категория)
    for (int level = 2; level <= _selectedCategoryLevels.length + 2; level++) {
      widgets.add(_buildCategoryLevelDropdown(level));
      // Между уровнями категорий делаем отступ чуть меньше, чем между секциями
      widgets.add(const SizedBox(height: 8));
    }

    return widgets;
  }

  /// Создает поле для выбора категории определенного уровня
  Widget _buildCategoryLevelDropdown(int level) {
    // Для второго уровня проверяем, что выбрана главная категория
    if (level == 2 && _selectedMainCategoryId == null) {
      return const SizedBox.shrink();
    }

    // Для уровней выше второго проверяем, что выбран предыдущий уровень
    if (level > 2 && _selectedCategoryLevels.length < level - 2) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MarketCategoriesBloc, MarketCategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (categories) {
            // Определяем parentId для текущего уровня
            int? parentId;
            if (level == 2) {
              // Для второго уровня parentId = null, ищем категории с partsMainCategoryId и parentId == null
              parentId = null;
            } else {
              // Для уровней выше второго parentId = ID категории предыдущего уровня
              parentId = _selectedCategoryLevels[level - 3];
            }

            // Фильтруем категории для текущего уровня
            final levelCategories = categories.where((c) {
              if (level == 2) {
                // Второй уровень: partsMainCategoryId == _selectedMainCategoryId && parentId == null
                return c.partsMainCategoryId == _selectedMainCategoryId && c.parentId == null;
              } else {
                // Уровни выше второго: parentId == ID категории предыдущего уровня
                return c.parentId == parentId;
              }
            }).toList();

            debugPrint('🔵 Уровень $level: найдено категорий: ${levelCategories.length} (parentId=$parentId)');

            // Если категорий нет, не показываем поле
            if (levelCategories.isEmpty) {
              return const SizedBox.shrink();
            }

            // Получаем выбранную категорию для этого уровня
            final selectedCategoryId = level <= _selectedCategoryLevels.length + 1
                ? _selectedCategoryLevels[level - 2]
                : null;

            return _buildCategoryLevelField(level, levelCategories, selectedCategoryId);
          },
          loading: () {
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

  /// Создает поле для выбора категории определенного уровня
  Widget _buildCategoryLevelField(int level, List<MarketCategoryEntity> categories, int? selectedCategoryId) {
    final selectedCategory = selectedCategoryId != null
        ? categories.firstWhere((category) => category.id == selectedCategoryId, orElse: () => categories.first)
        : null;
    final displayText = selectedCategoryId != null ? selectedCategory!.name : 'Выберите категорию $level-го уровня *';

    return InkWell(
      onTap: () => _showCategoryLevelBottomSheet(level, categories, selectedCategoryId),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Категория $level-го уровня *',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.arrow_drop_down),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        child: Text(
          displayText,
          style: AppStyles.regular14s.copyWith(
            color: selectedCategoryId != null ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  /// Показывает bottom sheet для выбора категории определенного уровня
  Future<void> _showCategoryLevelBottomSheet(
    int level,
    List<MarketCategoryEntity> categories,
    int? currentSelectedId,
  ) async {
    final result = await showUniversalBottomSheet<int?>(
      context: context,
      title: 'Выберите категорию $level-го уровня *',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      useRootNavigator: false, // Используем локальный navigator, а не root
      child: Builder(
        builder: (bottomSheetContext) {
          return ListView(
            shrinkWrap: true,
            children: [
              // Все категории обязательны, убираем опцию "Не выбрано"
              ...categories.map((category) {
                final isSelected = currentSelectedId == category.id;
                return ListTile(
                  title: Text(category.name, style: AppStyles.regular14s),
                  trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
                  selected: isSelected,
                  onTap: () {
                    Navigator.pop(bottomSheetContext, category.id);
                  },
                );
              }),
            ],
          );
        },
      ),
    );

    // Обрабатываем результат выбора (result всегда не null, так как "Не выбрано" убрано)
    if (result != null) {
      debugPrint('🔵 Выбрана категория $level-го уровня: id=${result}');
      setState(() {
        // Обновляем список выбранных категорий
        // level 2 -> index 0, level 3 -> index 1, и т.д.
        final index = level - 2;
        if (index < _selectedCategoryLevels.length) {
          // Если уровень уже был выбран, обновляем его и удаляем все уровни ниже
          _selectedCategoryLevels = _selectedCategoryLevels.sublist(0, index)..add(result);
        } else {
          // Если уровень новый, добавляем его
          _selectedCategoryLevels.add(result);
        }
      });

      // Загружаем категории следующего уровня
      debugPrint(
        '🔵 Загружаем категории ${level + 1}-го уровня для categoryId=${result}, mainCategoryId=${_selectedMainCategoryId}',
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
            itemCount: _additionalPhotos.length + 1, // +1 для кнопки "+ ещё"
            itemBuilder: (context, index) {
              if (index == _additionalPhotos.length) {
                // Последний элемент - кнопка "+ ещё"
                return _buildAddMorePhotoButton();
              }
              return _buildPhotoItem(_additionalPhotos[index], isMain: false);
            },
          )
        else
          _buildEmptyPhotoPlaceholder(isMain: false),
      ],
    );
  }

  Widget _buildAddMorePhotoButton() {
    return InkWell(
      onTap: () => _pickPhoto(isMain: false),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB), style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 32, color: Color(0xFF9CA5AF)),
            SizedBox(height: 8),
            Text('Ещё', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoItem(_PhotoItem photoItem, {required bool isMain}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
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
      onTap: () => _pickPhoto(isMain: isMain),
      child: Container(
        width: double.infinity,
        height: isMain ? 200 : 150,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, size: 48, color: Color(0xFF9CA5AF)),
            SizedBox(height: 12),
            Text(
              isMain ? 'Добавить основную фотографию' : 'Добавить фотографии',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickPhoto({required bool isMain}) async {
    final ImagePicker picker = ImagePicker();

    if (isMain) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        Uint8List? bytes;
        if (kIsWeb) {
          bytes = await image.readAsBytes();
        }
        setState(() {
          _mainPhoto = _PhotoItem(file: image, url: null, bytes: bytes, isNew: true);
        });
      }
    } else {
      // Для дополнительных фотографий используем множественный выбор
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty && mounted) {
        for (final image in images) {
          Uint8List? bytes;
          if (kIsWeb) {
            bytes = await image.readAsBytes();
          }
          if (mounted) {
            setState(() {
              _additionalPhotos.add(_PhotoItem(file: image, url: null, bytes: bytes, isNew: true));
            });
          }
        }
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
      title: 'Выберите категорию 1-го уровня',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      useRootNavigator: false, // Используем локальный navigator, а не root
      child: Builder(
        builder: (bottomSheetContext) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = _selectedMainCategoryId == category.id;
              return ListTile(
                title: Text(category.name, style: AppStyles.regular14s),
                trailing: isSelected ? Icon(Icons.check, color: AppColors.primary100p) : null,
                selected: isSelected,
                onTap: () {
                  debugPrint('🔵 [onTap] Выбрана главная категория: ${category.id} (${category.name})');
                  setState(() {
                    _selectedMainCategoryId = category.id;
                    _selectedCategoryLevels = []; // Сбрасываем все уровни категорий при смене главной
                  });
                  // Закрываем только bottom sheet, используя контекст bottom sheet
                  Navigator.pop(bottomSheetContext, category.id);
                  // Затем загружаем подкатегории для выбранной главной категории
                  debugPrint(
                    '🔵 [onTap] После Navigator.pop, загружаем подкатегории для mainCategoryId=${category.id}',
                  );
                  final event = MarketCategoriesEvent.getSubcategories(
                    productType: 'parts',
                    mainCategoryId: category.id,
                  );
                  debugPrint('🔵 [onTap] Создано событие: $event');
                  context.read<MarketCategoriesBloc>().add(event);
                  debugPrint('🔵 [onTap] Событие добавлено в BLoC');
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showManufacturerBottomSheet() async {
    final repository = getIt<MarketRepository>();
    final manufacturersResult = await repository.getPartsManufacturers();

    await showUniversalBottomSheet<Map<String, dynamic>?>(
      context: context,
      title: 'Выберите производителя',
      height: MediaQuery.of(context).size.height * 0.9,
      backgroundColor: Colors.white,
      useRootNavigator: false, // Используем локальный navigator, а не root
      child: Builder(
        builder: (bottomSheetContext) {
          return manufacturersResult.fold(
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
                      // Закрываем только bottom sheet, используя контекст bottom sheet
                      Navigator.pop(bottomSheetContext, {'id': manufacturerId, 'name': manufacturerName});
                    },
                  );
                }),
              ],
            ),
          );
        },
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
      useRootNavigator: false, // Используем локальный navigator, а не root
      child: Builder(
        builder: (bottomSheetContext) {
          return ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Не выбрано', style: AppStyles.regular14s),
                trailing: _condition == null ? Icon(Icons.check, color: AppColors.primary100p) : null,
                onTap: () {
                  setState(() {
                    _condition = null;
                  });
                  // Закрываем только bottom sheet, используя контекст bottom sheet
                  Navigator.pop(bottomSheetContext, null);
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
                    // Закрываем только bottom sheet, используя контекст bottom sheet
                    Navigator.pop(bottomSheetContext, condition['value']);
                  },
                );
              }),
            ],
          );
        },
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
