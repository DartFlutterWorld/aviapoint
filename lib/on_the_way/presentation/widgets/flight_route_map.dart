import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlightRouteMap extends StatefulWidget {
  final FlightEntity flight;
  final AirportService airportService;
  final double height;

  const FlightRouteMap({super.key, required this.flight, required this.airportService, this.height = 300});

  @override
  State<FlightRouteMap> createState() => _FlightRouteMapState();
}

class _FlightRouteMapState extends State<FlightRouteMap> {
  final MapController _mapController = MapController();
  final Distance _distance = const Distance();
  List<LatLng> _routePoints = [];
  List<Marker> _markers = [];
  bool _isLoading = true;
  LatLngBounds? _bounds;
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
    _loadRoute();
  }

  Future<void> _loadRoute() async {
    if (widget.flight.waypoints == null || widget.flight.waypoints!.isEmpty) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final waypoints = widget.flight.waypoints!;
      final List<LatLng> routePoints = [];
      final List<Marker> markers = [];

      // Получаем координаты для каждого аэропорта
      for (int i = 0; i < waypoints.length; i++) {
        final waypoint = waypoints[i];
        try {
          final airport = await widget.airportService.getAirportByCode(waypoint.airportCode);

          if (airport != null && airport.latitudeDeg != null && airport.longitudeDeg != null) {
            final position = LatLng(airport.latitudeDeg!, airport.longitudeDeg!);
            routePoints.add(position);

            // Создаем маркер для точки
            final isFirst = i == 0;
            final isLast = i == waypoints.length - 1;

            Color markerColor;
            IconData markerIcon;
            if (isFirst) {
              markerColor = Colors.green;
              markerIcon = Icons.flight_takeoff;
            } else if (isLast) {
              markerColor = Colors.red;
              markerIcon = Icons.flight_land;
            } else {
              markerColor = Colors.blue;
              markerIcon = Icons.flight;
            }

            markers.add(
              Marker(
                point: position,
                width: 50,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    showAirportInfoBottomSheet(context, waypoint.airportCode);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: markerColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2))],
                    ),
                    child: Icon(markerIcon, color: Colors.white, size: 24),
                  ),
                ),
              ),
            );
          }
        } catch (e) {
          print('❌ [FlightRouteMap] Ошибка загрузки аэропорта ${waypoint.airportCode}: $e');
        }
      }

      if (routePoints.isNotEmpty) {
        // Добавляем маркеры с расстояниями между точками
        for (int i = 0; i < routePoints.length - 1; i++) {
          final from = routePoints[i];
          final to = routePoints[i + 1];

          // Вычисляем расстояние в метрах
          final distanceInMeters = _distance.as(LengthUnit.Meter, from, to);

          // Конвертируем в километры
          final distanceInKm = distanceInMeters / 1000;

          // Форматируем расстояние всегда в километрах
          String distanceText;
          if (distanceInKm < 1) {
            // Если меньше 1 км, показываем с одним знаком после запятой
            distanceText = '${distanceInKm.toStringAsFixed(1)} км';
          } else if (distanceInKm < 100) {
            // От 1 до 100 км - с одним знаком после запятой
            distanceText = '${distanceInKm.toStringAsFixed(1)} км';
          } else {
            // Больше 100 км - без дробной части
            distanceText = '${distanceInKm.toStringAsFixed(0)} км';
          }

          // Вычисляем среднюю точку между двумя аэропортами
          final midPoint = LatLng((from.latitude + to.latitude) / 2, (from.longitude + to.longitude) / 2);

          // Создаем маркер с расстоянием
          markers.add(
            Marker(
              point: midPoint,
              width: 80,
              height: 28,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Color(0xFF0A6EFA), width: 1),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6, offset: const Offset(0, 2))],
                ),
                child: Center(
                  child: Text(
                    distanceText,
                    style: AppStyles.regular12s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.bold, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }

        // Вычисляем границы для отображения всего маршрута
        double minLat = routePoints.first.latitude;
        double maxLat = routePoints.first.latitude;
        double minLng = routePoints.first.longitude;
        double maxLng = routePoints.first.longitude;

        for (final point in routePoints) {
          minLat = minLat < point.latitude ? minLat : point.latitude;
          maxLat = maxLat > point.latitude ? maxLat : point.latitude;
          minLng = minLng < point.longitude ? minLng : point.longitude;
          maxLng = maxLng > point.longitude ? maxLng : point.longitude;
        }

        _bounds = LatLngBounds(LatLng(minLat, minLng), LatLng(maxLat, maxLng));

        setState(() {
          _routePoints = routePoints;
          _markers = markers;
          _isLoading = false;
        });

        // Устанавливаем камеру на весь маршрут после того, как карта будет готова
        if (_bounds != null && _isMapReady) {
          _fitCameraToBounds();
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e, stackTrace) {
      print('❌ [FlightRouteMap] Ошибка загрузки маршрута: $e');
      print('❌ [FlightRouteMap] Stack trace: $stackTrace');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.flight.waypoints == null || widget.flight.waypoints!.isEmpty) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text('Маршрут не указан', style: AppStyles.regular14s.copyWith(color: Colors.grey[600])),
        ),
      );
    }

    if (_isLoading) {
      return Container(
        height: widget.height,
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Начальная позиция карты (центр первого аэропорта или центр маршрута)
    LatLng initialPosition = const LatLng(55.7558, 37.6173); // Москва по умолчанию
    if (_routePoints.isNotEmpty) {
      if (_bounds != null) {
        initialPosition = LatLng((_bounds!.north + _bounds!.south) / 2, (_bounds!.east + _bounds!.west) / 2);
      } else {
        initialPosition = _routePoints.first;
      }
    }

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: initialPosition,
            initialZoom: _bounds != null ? 5.0 : 10.0,
            minZoom: 3.0,
            maxZoom: 18.0,
            onMapReady: () {
              setState(() {
                _isMapReady = true;
              });
              // После того как карта готова, устанавливаем камеру на маршрут
              if (_bounds != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _fitCameraToBounds();
                });
              }
            },
          ),
          children: [
            TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.aviapoint.app', maxZoom: 19),
            if (_routePoints.length > 1)
              PolylineLayer(
                polylines: [Polyline(points: _routePoints, strokeWidth: 3.0, color: const Color(0xFF0A6EFA))],
              ),
            MarkerLayer(markers: _markers),
          ],
        ),
      ),
    );
  }

  void _fitCameraToBounds() {
    if (_bounds != null && _isMapReady) {
      try {
        _mapController.fitCamera(CameraFit.bounds(bounds: _bounds!, padding: const EdgeInsets.all(50)));
      } catch (e) {
        print('⚠️ [FlightRouteMap] Ошибка установки камеры: $e');
        // Повторяем попытку через небольшую задержку
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted && _isMapReady) {
            try {
              _mapController.fitCamera(CameraFit.bounds(bounds: _bounds!, padding: const EdgeInsets.all(50)));
            } catch (e2) {
              print('⚠️ [FlightRouteMap] Повторная ошибка установки камеры: $e2');
            }
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
