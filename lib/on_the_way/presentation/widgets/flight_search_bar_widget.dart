import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/mappers/on_the_way_mapper.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FlightSearchBarWidget extends StatefulWidget {
  final String? initialValue;
  final String hintText;
  final ValueChanged<String> onSelected;
  final VoidCallback? onClear;
  final AirportService airportService;

  const FlightSearchBarWidget({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onSelected,
    this.onClear,
    required this.airportService,
  });

  @override
  State<FlightSearchBarWidget> createState() => _FlightSearchBarWidgetState();
}

class _FlightSearchBarWidgetState extends State<FlightSearchBarWidget> {
  late TextEditingController _controller;
  List<FlightEntity> _flightSuggestions = [];
  bool _showSuggestions = false;
  final FocusNode _focusNode = FocusNode();
  String? _searchQuery;
  bool _isSearchingFlights = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(() {
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
  void didUpdateWidget(FlightSearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
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

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      setState(() {
        _flightSuggestions = [];
        _showSuggestions = false;
        _searchQuery = null;
      });
      return;
    }

    setState(() {
      _searchQuery = query;
      _isSearchingFlights = true;
    });

    try {
      // Ищем полеты через этот аэропорт
      final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final onTheWayService = OnTheWayService(apiDatasource.dio);
      final flights = await onTheWayService.getFlights(airport: query);

      if (mounted && _searchQuery == query) {
        setState(() {
          _flightSuggestions = flights.take(10).map((dto) => OnTheWayMapper.toFlightEntity(dto)).toList(); // Ограничиваем до 10 полетов
          _showSuggestions = _flightSuggestions.isNotEmpty;
          _isSearchingFlights = false;
        });
      }
    } catch (e, stackTrace) {
      print('❌ [FlightSearchBarWidget] Ошибка поиска: $e');
      print('❌ [FlightSearchBarWidget] Stack trace: $stackTrace');
      if (mounted && _searchQuery == query) {
        setState(() {
          _flightSuggestions = [];
          _showSuggestions = false;
          _isSearchingFlights = false;
        });
      }
    }
  }

  void _selectFlight(FlightEntity flight) {
    // При выборе полета берем первый аэропорт из маршрута, который совпадает с запросом
    if (flight.waypoints != null && flight.waypoints!.isNotEmpty) {
      final matchingWaypoint = flight.waypoints!.firstWhere(
        (wp) => wp.airportCode.toUpperCase() == _searchQuery?.toUpperCase(),
        orElse: () => flight.waypoints!.first,
      );
      _controller.text = matchingWaypoint.airportCode;
      widget.onSelected(matchingWaypoint.airportCode);
    }
    if (mounted) {
      setState(() => _showSuggestions = false);
    }
    _focusNode.unfocus();
  }

  Widget _buildRouteDisplay(FlightEntity flight, String searchQuery) {
    if (flight.waypoints == null || flight.waypoints!.isEmpty) {
      return SizedBox.shrink();
    }

    final waypoints = flight.waypoints!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 4.w,
          runSpacing: 4.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...waypoints.asMap().entries.expand((entry) {
              final index = entry.key;
              final waypoint = entry.value;
              final isFirst = index == 0;
              final isLast = index == waypoints.length - 1;
              final isHighlighted = waypoint.airportCode.toUpperCase() == searchQuery.toUpperCase();

              return [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight),
                      size: 14,
                      color: isHighlighted ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: isHighlighted ? Color(0xFF0A6EFA).withOpacity(0.1) : Colors.transparent,
                        borderRadius: BorderRadius.circular(4.r),
                        border: isHighlighted ? Border.all(color: Color(0xFF0A6EFA), width: 1.5) : null,
                      ),
                      child: Text(
                        waypoint.airportCode,
                        style: AppStyles.regular12s.copyWith(
                          color: isHighlighted ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                if (!isLast) ...[
                  SizedBox(width: 4.w),
                  Icon(Icons.arrow_forward, size: 14, color: Color(0xFF0A6EFA)),
                  SizedBox(width: 4.w),
                ],
              ];
            }).toList(),
          ],
        ),
        // Дополнительная информация о точках
        if (waypoints.any((wp) => wp.airportName != null || wp.airportCity != null)) ...[
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 4.h,
            children: waypoints.where((wp) => wp.airportName != null || wp.airportCity != null).map((waypoint) {
              final isHighlighted = waypoint.airportCode.toUpperCase() == searchQuery.toUpperCase();
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    waypoint.airportCode,
                    style: AppStyles.regular12s.copyWith(
                      color: isHighlighted ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                      fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (waypoint.airportName != null || waypoint.airportCity != null) ...[
                    Text(
                      ' • ',
                      style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                    ),
                    Text(
                      [
                        if (waypoint.airportName != null) waypoint.airportName,
                        if (waypoint.airportCity != null) waypoint.airportCity,
                        if (waypoint.airportRegion != null) waypoint.airportRegion,
                      ].where((e) => e != null).join(', '),
                      style: AppStyles.regular12s.copyWith(
                        color: isHighlighted ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: _search,
          onTap: () {
            if (_controller.text.isEmpty) {
              _search('');
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
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          ),
          style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
        ),
        if (_showSuggestions && _flightSuggestions.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xFFD9E6F8)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 4))],
            ),
            constraints: BoxConstraints(maxHeight: 500.h),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Полеты
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Text(
                    'Полеты',
                    style: AppStyles.bold12s.copyWith(color: Color(0xFF9CA5AF)),
                  ),
                ),
                ..._flightSuggestions.map((flight) {
                  return InkWell(
                    onTap: () => _selectFlight(flight),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flight, size: 16, color: Color(0xFF0A6EFA)),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  'Полёт #${flight.id}',
                                  style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                                ),
                              ),
                              if (flight.pilotFullName != null) ...[
                                Icon(Icons.person, size: 14, color: Color(0xFF9CA5AF)),
                                SizedBox(width: 4.w),
                                Text(
                                  flight.pilotFullName!,
                                  style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 12, color: Color(0xFF9CA5AF)),
                              SizedBox(width: 4.w),
                              Text(
                                DateFormat('dd.MM.yyyy').format(flight.departureDate),
                                style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          if (_searchQuery != null) _buildRouteDisplay(flight, _searchQuery!),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                // Индикатор загрузки
                if (_isSearchingFlights)
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

