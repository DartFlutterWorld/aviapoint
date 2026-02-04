import 'package:flutter/material.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';

/// Виджет для выбора совместимых моделей самолётов
/// Позволяет выбрать модели из каталога и добавить вручную введённые модели
class CompatibleAircraftModelsSelector extends StatefulWidget {
  final List<int>? initialSelectedModelIds;
  final String? initialManualText;
  final ValueChanged<List<int>>? onSelectedModelsChanged;
  final ValueChanged<String?>? onManualTextChanged;

  const CompatibleAircraftModelsSelector({
    super.key,
    this.initialSelectedModelIds,
    this.initialManualText,
    this.onSelectedModelsChanged,
    this.onManualTextChanged,
  });

  @override
  State<CompatibleAircraftModelsSelector> createState() => _CompatibleAircraftModelsSelectorState();
}

class _CompatibleAircraftModelsSelectorState extends State<CompatibleAircraftModelsSelector> {
  final TextEditingController _manualInputController = TextEditingController();

  List<AircraftModelDto> _selectedModels = [];
  List<String> _manualModels = [];

  bool _showManualInput = false;

  @override
  void initState() {
    super.initState();
    _manualInputController.text = widget.initialManualText ?? '';
    if (widget.initialManualText != null && widget.initialManualText!.isNotEmpty) {
      _manualModels = widget.initialManualText!.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    }
    _loadAllModels();
  }

  @override
  void dispose() {
    _manualInputController.dispose();
    super.dispose();
  }

  Future<void> _loadAllModels() async {
    try {
      final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final service = OnTheWayService(apiDatasource.dio);
      final models = await service.getAircraftModels();

      // Загружаем выбранные модели если есть initialSelectedModelIds
      if (widget.initialSelectedModelIds != null && widget.initialSelectedModelIds!.isNotEmpty) {
        setState(() {
          _selectedModels = models.where((m) => widget.initialSelectedModelIds!.contains(m.id)).toList();
        });
        widget.onSelectedModelsChanged?.call(_selectedModels.map((m) => m.id).toList());
      }
    } catch (e) {
      debugPrint('Error loading aircraft models: $e');
    }
  }


  void _removeSelectedModel(AircraftModelDto model) {
    setState(() {
      _selectedModels.removeWhere((m) => m.id == model.id);
    });
    widget.onSelectedModelsChanged?.call(_selectedModels.map((m) => m.id).toList());
  }

  void _addManualModel() {
    final text = _manualInputController.text.trim();
    if (text.isNotEmpty && !_manualModels.contains(text)) {
      setState(() {
        _manualModels.add(text);
        _manualInputController.clear();
        _showManualInput = false;
      });
      _updateManualText();
    }
  }

  void _removeManualModel(String model) {
    setState(() {
      _manualModels.remove(model);
    });
    _updateManualText();
  }

  void _updateManualText() {
    final text = _manualModels.isEmpty ? null : _manualModels.join(', ');
    widget.onManualTextChanged?.call(text);
  }

  Future<void> _showAircraftModelsModal(BuildContext context) async {
    final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
    final service = OnTheWayService(apiDatasource.dio);
    
    try {
      final allModels = await service.getAircraftModels();
      
      if (!mounted) return;
      
      final selectedIds = _selectedModels.map((m) => m.id).toSet();
      final result = await showDialog<List<AircraftModelDto>>(
        context: context,
        builder: (context) => _AircraftModelsSelectionDialog(
          allModels: allModels,
          selectedIds: selectedIds,
        ),
      );
      
      if (result != null && mounted) {
        setState(() {
          _selectedModels = result;
        });
        widget.onSelectedModelsChanged?.call(result.map((m) => m.id).toList());
      }
    } catch (e) {
      debugPrint('Error loading aircraft models: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки моделей'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Совместимые модели самолётов', style: AppStyles.bold14s.copyWith(color: AppColors.textPrimary)),
        SizedBox(height: 12),
        
        // Кнопка для открытия модалки выбора моделей
        InkWell(
          onTap: () => _showAircraftModelsModal(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.strokeForDarkArea),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 20, color: AppColors.textSecondary),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Выбрать модели из каталога',
                    style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),

        // Выбранные модели из каталога
        if (_selectedModels.isNotEmpty) ...[
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _selectedModels.map((model) {
              return Chip(
                label: Text(model.getFullName(), style: AppStyles.regular12s),
                onDeleted: () => _removeSelectedModel(model),
                deleteIcon: Icon(Icons.close, size: 18),
                backgroundColor: AppColors.primary100p.withOpacity(0.1),
                labelStyle: AppStyles.regular12s.copyWith(color: AppColors.primary100p),
              );
            }).toList(),
          ),
        ],

        // Вручную введённые модели
        if (_manualModels.isNotEmpty) ...[
          SizedBox(height: 12),
          Text('Введённые вручную:', style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _manualModels.map((model) {
              return Chip(
                label: Text(model, style: AppStyles.regular12s),
                onDeleted: () => _removeManualModel(model),
                deleteIcon: Icon(Icons.close, size: 18),
                backgroundColor: AppColors.textSecondary.withOpacity(0.1),
                labelStyle: AppStyles.regular12s.copyWith(color: AppColors.textSecondary),
              );
            }).toList(),
          ),
        ],

        // Кнопка для ручного ввода
        if (!_showManualInput) ...[
          SizedBox(height: 12),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _showManualInput = true;
              });
            },
            icon: Icon(Icons.add, size: 18, color: AppColors.primary100p),
            label: Text('Добавить модель вручную', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
          ),
        ],

        // Поле для ручного ввода
        if (_showManualInput) ...[
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _manualInputController,
                  decoration: InputDecoration(
                    hintText: 'Например: Cessna 172',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (_) => _addManualModel(),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.check, color: AppColors.primary100p),
                onPressed: _addManualModel,
              ),
              IconButton(
                icon: Icon(Icons.close, color: AppColors.textSecondary),
                onPressed: () {
                  setState(() {
                    _showManualInput = false;
                    _manualInputController.clear();
                  });
                },
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _AircraftModelsSelectionDialog extends StatefulWidget {
  final List<AircraftModelDto> allModels;
  final Set<int> selectedIds;

  const _AircraftModelsSelectionDialog({
    required this.allModels,
    required this.selectedIds,
  });

  @override
  State<_AircraftModelsSelectionDialog> createState() => _AircraftModelsSelectionDialogState();
}

class _AircraftModelsSelectionDialogState extends State<_AircraftModelsSelectionDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<AircraftModelDto> _filteredModels = [];
  Set<int> _selectedIds = {};

  @override
  void initState() {
    super.initState();
    _selectedIds = Set.from(widget.selectedIds);
    _filteredModels = widget.allModels;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredModels = widget.allModels;
      } else {
        _filteredModels = widget.allModels.where((model) {
          return model.getFullName().toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void _toggleSelection(AircraftModelDto model) {
    setState(() {
      if (_selectedIds.contains(model.id)) {
        _selectedIds.remove(model.id);
      } else {
        _selectedIds.add(model.id);
      }
    });
  }

  void _confirmSelection() {
    final selected = widget.allModels.where((m) => _selectedIds.contains(m.id)).toList();
    Navigator.of(context).pop(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        height: 600,
        width: 500,
        child: Column(
          children: [
            // Заголовок
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Выберите модели самолётов',
                      style: AppStyles.bold16s,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Divider(),
            // Поиск
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Поиск модели...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Список моделей
            Expanded(
              child: ListView.builder(
                itemCount: _filteredModels.length,
                itemBuilder: (context, index) {
                  final model = _filteredModels[index];
                  final isSelected = _selectedIds.contains(model.id);
                  return CheckboxListTile(
                    title: Text(model.getFullName(), style: AppStyles.regular14s),
                    value: isSelected,
                    onChanged: (_) => _toggleSelection(model),
                  );
                },
              ),
            ),
            Divider(),
            // Кнопки
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Отмена'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _confirmSelection,
                    child: Text('Выбрать (${_selectedIds.length})'),
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
