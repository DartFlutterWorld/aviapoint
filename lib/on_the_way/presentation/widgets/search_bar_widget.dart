import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/data/models/airport_model.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final String? initialValue;
  final String hintText;
  final ValueChanged<String> onSelected;
  final VoidCallback? onClear;
  final AirportService airportService;

  const SearchBarWidget({super.key, this.initialValue, required this.hintText, required this.onSelected, this.onClear, required this.airportService});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  List<AirportModel> _suggestions = [];
  bool _showSuggestions = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(() {
      // Обновляем UI при изменении текста для отображения кнопки очистки
      if (mounted) {
        setState(() {});
      }
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() => _showSuggestions = false);
          }
        });
      }
    });
  }

  @override
  void didUpdateWidget(SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Обновляем контроллер, если initialValue изменился
    if (oldWidget.initialValue != widget.initialValue) {
      final newValue = widget.initialValue?.isEmpty == false ? widget.initialValue! : '';
      if (_controller.text != newValue) {
        _controller.text = newValue;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _searchAirports(String query) async {
    try {
      print('🔍 [SearchBarWidget] Поиск аэропортов: "$query"');
      // Ищем аэропорты по запросу (если запрос пустой, вернется пустой список)
      print('🔎 [SearchBarWidget] Поиск по запросу: "$query"');
      final results = await widget.airportService.searchAirports(query);

      print('✅ [SearchBarWidget] Найдено ${results.length} аэропортов');
      if (mounted) {
        setState(() {
          _suggestions = results;
          _showSuggestions = results.isNotEmpty;
        });
        print('📊 [SearchBarWidget] Подсказки: ${_showSuggestions ? "показаны" : "скрыты"} (${_suggestions.length} элементов)');
      }
    } catch (e, stackTrace) {
      print('❌ [SearchBarWidget] Ошибка поиска аэропортов: $e');
      print('❌ [SearchBarWidget] Stack trace: $stackTrace');
      if (mounted) {
        setState(() {
          _suggestions = [];
          _showSuggestions = false;
        });
      }
    }
  }

  void _selectAirport(AirportModel airport) {
    _controller.text = airport.code;
    widget.onSelected(airport.code);
    if (mounted) {
      setState(() => _showSuggestions = false);
    }
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: _searchAirports,
          onTap: () {
            if (_controller.text.isEmpty) {
              _searchAirports('');
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
            prefixIcon: Icon(Icons.search, color: Color(0xFF9CA5AF)),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Color(0xFF9CA5AF), size: 20),
                    onPressed: () {
                      _controller.clear();
                      if (widget.onClear != null) {
                        widget.onClear!();
                      } else {
                        widget.onSelected('');
                      }
                      if (mounted) {
                        setState(() => _showSuggestions = false);
                      }
                    },
                  )
                : null,
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
        ),
        if (_showSuggestions && _suggestions.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFD9E6F8)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: Offset(0, 4), spreadRadius: 0)],
            ),
            constraints: BoxConstraints(maxHeight: 300),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              separatorBuilder: (context, index) => Divider(height: 1, thickness: 1, color: Color(0xFFF3F4F6)),
              itemBuilder: (context, index) {
                final airport = _suggestions[index];
                // Определяем иконку в зависимости от типа
                IconData iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
                Color iconColor = Color(0xFF0A6EFA);
                final typeLower = airport.type.toLowerCase();
                if (typeLower == 'heliport' || typeLower == 'вертодром' || typeLower.contains('heliport') || typeLower.contains('вертодром')) {
                  iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
                  iconColor = Color(0xFF10B981);
                }

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _selectAirport(airport),
                    borderRadius: BorderRadius.circular(0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              // Иконка типа аэропорта
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                                child: Icon(iconData, color: iconColor, size: 20),
                              ),
                              SizedBox(width: 16),
                              // Основная информация
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Код и название
                                    Row(
                                      children: [
                                        Text(airport.code, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                                        if (airport.identRu != null && airport.identRu != airport.code) ...[
                                          SizedBox(width: 6),
                                          Text('(${airport.identRu})', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                        ],
                                        if (airport.isInternational == true) ...[
                                          SizedBox(width: 8),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                            decoration: BoxDecoration(color: Color(0xFF0A6EFA).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                            child: Text(
                                              'INT',
                                              style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    // Название аэропорта
                                    Text(
                                      airport.name,
                                      style: AppStyles.regular13s.copyWith(color: Color(0xFF374151)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Тип аэропорта под названием
                                    if (airport.typeDisplay.isNotEmpty) ...[SizedBox(height: 4), Text(airport.typeDisplay, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)))],
                                    // Адрес (город и регион) - без ограничений по overflow
                                    if (airport.city != null || airport.region != null) ...[
                                      SizedBox(height: 4),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 4,
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          if (airport.city != null) ...[
                                            Icon(Icons.location_city, size: 12, color: Color(0xFF9CA5AF)),
                                            SizedBox(width: 4),
                                            Text(airport.city!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                          ],
                                          if (airport.region != null) ...[
                                            if (airport.city != null) Text('•', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                            Text(airport.region!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Статус активности в правом верхнем углу
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: airport.isActive ? Color(0xFF10B981).withOpacity(0.1) : Color(0xFFEF4444).withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                airport.isActive ? 'Действующий' : 'Недействующий',
                                style: AppStyles.medium10s.copyWith(color: airport.isActive ? Color(0xFF10B981) : Color(0xFFEF4444), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
