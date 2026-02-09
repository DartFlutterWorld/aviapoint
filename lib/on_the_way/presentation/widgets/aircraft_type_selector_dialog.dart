import 'package:flutter/material.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_manufacturer_dto.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

class AircraftTypeSelectorDialog extends StatefulWidget {
  final String? initialValue;
  final bool returnModelId; // Если true, возвращает ID модели вместо названия

  const AircraftTypeSelectorDialog({super.key, this.initialValue, this.returnModelId = false});

  @override
  State<AircraftTypeSelectorDialog> createState() => _AircraftTypeSelectorDialogState();
}

class _AircraftTypeSelectorDialogState extends State<AircraftTypeSelectorDialog> {
  final TextEditingController _manufacturerSearchController = TextEditingController();
  final FocusNode _manufacturerFocusNode = FocusNode();
  final TextEditingController _manualInputController = TextEditingController();

  List<AircraftManufacturerDto> _manufacturers = [];
  List<AircraftManufacturerDto> _filteredManufacturers = [];
  List<AircraftModelDto> _models = [];

  AircraftManufacturerDto? _selectedManufacturer;
  AircraftModelDto? _selectedModel;

  bool _isLoadingManufacturers = true;
  bool _isLoadingModels = false;
  bool _showManufacturerSuggestions = false;
  bool _isManualMode = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      _manualInputController.text = widget.initialValue!;
    }
    _loadManufacturers();
    _manufacturerSearchController.addListener(_onManufacturerSearchChanged);
    _manufacturerFocusNode.addListener(() {
      if (_manufacturerFocusNode.hasFocus) {
        // При получении фокуса показываем подсказки если есть производители
        if (_manufacturers.isNotEmpty && _selectedManufacturer == null) {
          setState(() {
            _filteredManufacturers = _manufacturers;
            _showManufacturerSuggestions = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _manufacturerSearchController.dispose();
    _manufacturerFocusNode.dispose();
    _manualInputController.dispose();
    super.dispose();
  }

  Future<void> _loadManufacturers() async {
    setState(() {
      _isLoadingManufacturers = true;
    });

    try {
      final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final service = OnTheWayService(apiDatasource.dio);
      debugPrint('✈️ [AircraftTypeSelectorDialog] Loading manufacturers...');
      final manufacturers = await service.getAircraftManufacturers();
      debugPrint('✈️ [AircraftTypeSelectorDialog] Loaded ${manufacturers.length} manufacturers');

      setState(() {
        _manufacturers = manufacturers;
        _filteredManufacturers = manufacturers;
        _isLoadingManufacturers = false;
        if (_selectedManufacturer == null) {
          _showManufacturerSuggestions = true;
        }
      });
    } catch (e, stack) {
      debugPrint('✈️ [AircraftTypeSelectorDialog] Error loading manufacturers: $e');
      debugPrint('$stack');
      setState(() {
        _isLoadingManufacturers = false;
      });
    }
  }

  void _onManufacturerSearchChanged() {
    final query = _manufacturerSearchController.text.toLowerCase().trim();

    if (query.isEmpty) {
      setState(() {
        _filteredManufacturers = _manufacturers;
        _showManufacturerSuggestions = _manufacturers.isNotEmpty && _selectedManufacturer == null;
      });
      return;
    }

    final filtered = _manufacturers.where((manufacturer) {
      return manufacturer.name.toLowerCase().contains(query);
    }).toList();

    setState(() {
      _filteredManufacturers = filtered;
      _showManufacturerSuggestions = filtered.isNotEmpty && _selectedManufacturer == null;
    });
  }

  void _selectManufacturer(AircraftManufacturerDto manufacturer) {
    debugPrint('✈️ [AircraftTypeSelectorDialog] Selected manufacturer: ${manufacturer.name} (id: ${manufacturer.id})');
    setState(() {
      _selectedManufacturer = manufacturer;
      _manufacturerSearchController.text = manufacturer.name;
      _showManufacturerSuggestions = false;
      _models = [];
      _selectedModel = null;
    });
    _loadModels(manufacturer.id);
  }

  Future<void> _loadModels(int manufacturerId) async {
    setState(() {
      _isLoadingModels = true;
    });

    try {
      final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final service = OnTheWayService(apiDatasource.dio);
      debugPrint('✈️ [AircraftTypeSelectorDialog] Loading models for manufacturer id: $manufacturerId');
      final models = await service.getAircraftModels(manufacturerId: manufacturerId);
      debugPrint('✈️ [AircraftTypeSelectorDialog] Loaded ${models.length} models');

      setState(() {
        _models = models;
        _isLoadingModels = false;
      });
    } catch (e, stack) {
      debugPrint('✈️ [AircraftTypeSelectorDialog] Error loading models: $e');

      debugPrint('$stack');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при загрузке моделей. Попробуйте еще раз или введите вручную.'),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        _isLoadingModels = false;
      });
    }
  }

  void _selectModel(AircraftModelDto model) {
    setState(() {
      _selectedModel = model;
    });
  }

  void _confirmSelection() {
    if (_selectedModel != null) {
      final fullName = _selectedModel!.getFullName();
      if (widget.returnModelId) {
        Navigator.of(context).pop({'id': _selectedModel!.id, 'fullName': fullName});
      } else {
        Navigator.of(context).pop(fullName);
      }
    } else if (_isManualMode && _manualInputController.text.trim().isNotEmpty) {
      final manualModel = _manualInputController.text.trim();
      final manufacturerName = _selectedManufacturer?.name.trim();
      final fullName = manufacturerName != null && manufacturerName.isNotEmpty
          ? // Если пользователь уже указал производителя вручную в начале, не дублируем его
            (manualModel.toLowerCase().startsWith(manufacturerName.toLowerCase())
                ? manualModel
                : '$manufacturerName $manualModel')
          : manualModel;
      if (widget.returnModelId) {
        Navigator.of(context).pop({'id': null, 'fullName': fullName});
      } else {
        Navigator.of(context).pop(fullName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 500,
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Шапка с крестиком и заголовком ниже
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, right: 8),
                    child: IconButton(
                      icon: Icon(Icons.close, color: Color(0xFF9CA5AF), size: 22),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.all(8),
                      constraints: BoxConstraints(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Text(
                      'Выберите авиатехнику',
                      style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            // Основной контент
            Expanded(
              child: SingleChildScrollView(
                physics: _selectedManufacturer != null ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Поиск производителя
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _isLoadingManufacturers
                              ? Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                )
                              : TextField(
                                  controller: _manufacturerSearchController,
                                  focusNode: _manufacturerFocusNode,
                                  readOnly: _selectedManufacturer != null,
                                  onChanged: (_) => _onManufacturerSearchChanged(),
                                  style: AppStyles.regular14s,
                                  onTap: () {
                                    if (_selectedManufacturer == null &&
                                        !_isLoadingManufacturers &&
                                        _manufacturers.isNotEmpty) {
                                      setState(() {
                                        _filteredManufacturers = _manufacturers;
                                        _showManufacturerSuggestions = true;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: _selectedManufacturer == null
                                        ? 'Поиск производителя...'
                                        : _selectedManufacturer!.name,
                                    hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                                    prefixIcon: Icon(Icons.search, color: Color(0xFF9CA5AF), size: 20),
                                    suffixIcon: _selectedManufacturer != null
                                        ? IconButton(
                                            icon: Icon(Icons.clear, color: Color(0xFF9CA5AF), size: 18),
                                            onPressed: () {
                                              setState(() {
                                                _selectedManufacturer = null;
                                                _manufacturerSearchController.clear();
                                                _models = [];
                                                _selectedModel = null;
                                                _isManualMode = false;
                                                _showManufacturerSuggestions = true;
                                              });
                                            },
                                          )
                                        : _manufacturerSearchController.text.isNotEmpty
                                        ? IconButton(
                                            icon: Icon(Icons.clear, color: Color(0xFF9CA5AF), size: 18),
                                            onPressed: () {
                                              setState(() {
                                                _manufacturerSearchController.clear();
                                                _onManufacturerSearchChanged();
                                              });
                                            },
                                          )
                                        : null,
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 1.5),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  ),
                                ),
                        ],
                      ),
                    ),

                    // Подсказки производителей
                    if (_showManufacturerSuggestions &&
                        _selectedManufacturer == null &&
                        _filteredManufacturers.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 320),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFD9E6F8)),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 4)),
                            ],
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: _filteredManufacturers.length,
                            itemBuilder: (context, index) {
                              final manufacturer = _filteredManufacturers[index];
                              return InkWell(
                                onTap: () => _selectManufacturer(manufacturer),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    border: index != _filteredManufacturers.length - 1
                                        ? Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1))
                                        : null,
                                  ),
                                  child: Text(
                                    manufacturer.name,
                                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    // Список моделей
                    if (_selectedManufacturer != null && !_isManualMode)
                      Container(
                        height: 320,
                        child: _isLoadingModels
                            ? Center(child: CircularProgressIndicator())
                            : _models.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.all(40),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.airplanemode_inactive, size: 64, color: Color(0xFF9CA5AF)),
                                      SizedBox(height: 16),
                                      Text(
                                        'Модели не найдены',
                                        style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 16),
                                      TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            _isManualMode = true;
                                          });
                                        },
                                        icon: Icon(Icons.edit, size: 18, color: Color(0xFF0A6EFA)),
                                        label: Text(
                                          'Ввести вручную',
                                          style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                                    child: Text('Модели', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      itemCount: _models.length,
                                      itemBuilder: (context, index) {
                                        final model = _models[index];
                                        print(model);
                                        final isSelected = _selectedModel?.id == model.id;
                                        return InkWell(
                                          onTap: () => _selectModel(model),
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                            decoration: BoxDecoration(
                                              color: isSelected ? Color(0xFFE3F1FF) : Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                color: isSelected ? Color(0xFF0A6EFA) : Color(0xFFE5E7EB),
                                                width: isSelected ? 2 : 1,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    model.modelCode,
                                                    style: AppStyles.bold14s.copyWith(
                                                      color: isSelected ? Color(0xFF0A6EFA) : Color(0xFF374151),
                                                    ),
                                                  ),
                                                ),
                                                if (isSelected)
                                                  Icon(Icons.check_circle, color: Color(0xFF0A6EFA), size: 20),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    child: TextButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _isManualMode = true;
                                        });
                                      },
                                      icon: Icon(Icons.edit, size: 16, color: Color(0xFF9CA5AF)),
                                      label: Text(
                                        'Ввести другую модель вручную',
                                        style: AppStyles.bold16s.copyWith(color: Color(0xFF9CA5AF)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),

                    // Ручной ввод
                    if (_isManualMode)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Введите название модели вручную',
                              style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              controller: _manualInputController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Например, Cessna 172',
                                hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              ),
                              onSubmitted: (_) => _confirmSelection(),
                            ),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isManualMode = false;
                                });
                              },
                              child: Text(
                                'Вернуться к каталогу',
                                style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA)),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Кнопки
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Отмена', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                  ),
                  SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: _confirmSelection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0A6EFA),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Сохранить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
