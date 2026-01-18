import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

class LocationPickerWidget extends StatefulWidget {
  final String? initialLocation;
  final LatLng? initialCoordinates;
  final ValueChanged<Map<String, dynamic>>? onLocationSelected;

  const LocationPickerWidget({
    super.key,
    this.initialLocation,
    this.initialCoordinates,
    this.onLocationSelected,
  });

  @override
  State<LocationPickerWidget> createState() => _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends State<LocationPickerWidget> {
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  final FocusNode _searchFocusNode = FocusNode();
  late final Dio _dio;

  List<Map<String, dynamic>> _suggestions = [];
  bool _isLoadingSuggestions = false;
  LatLng? _selectedLocation;
  String? _selectedAddress;
  bool _showSuggestions = false;
  Timer? _debounceTimer;
  String _lastSearchQuery = ''; // Храним последний запрос для определения изменений

  @override
  void initState() {
    super.initState();
    // Настраиваем Dio с User-Agent для избежания блокировки
    _dio = Dio(BaseOptions(
      headers: {
        'User-Agent': 'AviaPoint App (Flutter)',
      },
      validateStatus: (status) => status != null && status < 500,
    ));
    
    if (widget.initialLocation != null) {
      _searchController.text = widget.initialLocation!;
      _selectedAddress = widget.initialLocation;
      
      // Если есть адрес, но нет координат, выполняем геокодирование
      if (widget.initialCoordinates == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _geocodeAddress(widget.initialLocation!);
        });
      }
    }
    if (widget.initialCoordinates != null) {
      _selectedLocation = widget.initialCoordinates;
      _updateMapPosition();
    }
    _searchController.addListener(_onSearchChanged);
    _searchController.addListener(() {
      // Обновляем UI при изменении текста для показа/скрытия крестика
      if (mounted) {
        setState(() {});
      }
    });
    _searchFocusNode.addListener(() {
      // Скрываем подсказки при потере фокуса
      if (!_searchFocusNode.hasFocus) {
        setState(() => _showSuggestions = false);
      }
      // Не показываем подсказки автоматически при получении фокуса
      // Они появятся только при изменении текста через _onSearchChanged
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _dio.close();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    final query = _searchController.text.trim();
    
    // Если текст не изменился (например, после выбора подсказки), не показываем подсказки
    if (query == _lastSearchQuery) {
      return;
    }
    
    if (query.length < 3) {
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
        _isLoadingSuggestions = false;
        _lastSearchQuery = query;
      });
      return;
    }

    // Обновляем последний запрос только при реальном изменении
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        // Проверяем, что текст всё ещё отличается
        final currentQuery = _searchController.text.trim();
        if (currentQuery != _lastSearchQuery) {
          _lastSearchQuery = currentQuery;
          _searchAddresses(currentQuery);
        }
      }
    });
  }

  Future<void> _searchAddresses(String query) async {
    if (!mounted) return;
    
    setState(() {
      _isLoadingSuggestions = true;
      _showSuggestions = true;
    });

    try {
      // Пробуем сначала Nominatim API (более открытый)
      final response = await _dio.get<dynamic>(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 5,
          'addressdetails': 1,
          'accept-language': 'ru',
        },
        options: Options(
          headers: {
            'User-Agent': 'AviaPoint App (Flutter)',
          },
          responseType: ResponseType.json,
        ),
      );

      if (!mounted) return;

      if (response.statusCode == 200 && response.data != null) {
        // Nominatim search возвращает массив результатов
        final results = response.data is List ? response.data as List<dynamic> : null;
        if (results != null && results.isNotEmpty) {
          setState(() {
            _suggestions = results.map((result) {
              final item = result as Map<String, dynamic>;
              final address = item['address'] as Map<String, dynamic>?;
              
              final lat = double.tryParse(item['lat']?.toString() ?? '');
              final lng = double.tryParse(item['lon']?.toString() ?? '');
              
              // Формируем адрес в том же формате, что и в поисковой строке
              final displayName = _buildDisplayNameFromAddress(address);
              
              return {
                'name': item['name'] ?? '',
                'street': address?['road'] ?? address?['street'] ?? '',
                'city': address?['city'] ?? address?['town'] ?? address?['village'] ?? '',
                'region': address?['state'] ?? address?['region'] ?? address?['state_district'] ?? '',
                'country': address?['country'] ?? '',
                'postcode': address?['postcode'] ?? '',
                'lat': lat,
                'lng': lng,
                'displayName': displayName.isNotEmpty ? displayName : (item['name'] as String? ?? ''),
              };
            }).where((suggestion) => suggestion['lat'] != null && suggestion['lng'] != null).toList();
            _isLoadingSuggestions = false;
            _showSuggestions = true;
          });
        } else {
          setState(() {
            _suggestions = [];
            _isLoadingSuggestions = false;
            _showSuggestions = false;
          });
        }
      } else {
        setState(() {
          _suggestions = [];
          _isLoadingSuggestions = false;
          _showSuggestions = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _suggestions = [];
          _isLoadingSuggestions = false;
          _showSuggestions = false;
        });
        print('Ошибка поиска адресов: $e');
      }
    }
  }

  String _buildDisplayNameFromAddress(Map<String, dynamic>? address) {
    if (address == null) return '';
    final parts = <String>[];
    
    // Сначала область/регион
    String? region;
    if (address['state'] != null) {
      region = address['state'];
    } else if (address['region'] != null) {
      region = address['region'];
    } else if (address['state_district'] != null) {
      region = address['state_district'];
    }
    if (region != null) parts.add(region);
    
    // Потом город/посёлок
    String? city;
    if (address['city'] != null) {
      city = address['city'];
    } else if (address['town'] != null) {
      city = address['town'];
    } else if (address['village'] != null) {
      city = address['village'];
    } else if (address['municipality'] != null) {
      city = address['municipality'];
    } else if (address['hamlet'] != null) {
      city = address['hamlet'];
    }
    if (city != null) parts.add(city);
    
    // В конце адрес (улица и дом)
    if (address['road'] != null || address['street'] != null) {
      final street = address['road'] ?? address['street'] ?? '';
      if (address['house_number'] != null) {
        parts.add('$street, ${address['house_number']}');
      } else {
        parts.add(street);
      }
    }
    
    return parts.join(', ');
  }

  void _selectSuggestion(Map<String, dynamic> suggestion) {
    final lat = suggestion['lat'] as double?;
    final lng = suggestion['lng'] as double?;
    final displayName = suggestion['displayName'] as String?;

    if (lat != null && lng != null) {
      // Убираем фокус с поля поиска, чтобы скрыть подсказки
      _searchFocusNode.unfocus();
      
      final selectedAddress = displayName ?? _searchController.text;
      
      setState(() {
        _selectedLocation = LatLng(lat, lng);
        _selectedAddress = selectedAddress;
        _searchController.text = selectedAddress;
        _showSuggestions = false;
        _suggestions = [];
        _isLoadingSuggestions = false;
        // Обновляем последний запрос, чтобы при клике на поле подсказки не появлялись
        _lastSearchQuery = selectedAddress;
      });

      _updateMapPosition();
      _notifyLocationSelected();
    }
  }

  void _updateMapPosition() {
    if (_selectedLocation != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController.move(_selectedLocation!, 15.0);
      });
    }
  }

  Future<void> _geocodeAddress(String address) async {
    try {
      // Используем Nominatim API для геокодирования адреса
      final response = await _dio.get<dynamic>(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': address,
          'format': 'json',
          'limit': 1,
          'addressdetails': 1,
          'accept-language': 'ru',
        },
        options: Options(
          headers: {
            'User-Agent': 'AviaPoint App (Flutter)',
          },
          responseType: ResponseType.json,
        ),
      );

      if (!mounted) return;

      if (response.statusCode == 200 && response.data != null) {
        // Nominatim search возвращает массив результатов
        final results = response.data is List ? response.data as List<dynamic> : null;
        if (results != null && results.isNotEmpty) {
          final firstResult = results.first as Map<String, dynamic>;
          final lat = double.tryParse(firstResult['lat']?.toString() ?? '');
          final lng = double.tryParse(firstResult['lon']?.toString() ?? '');
          
          if (lat != null && lng != null) {
            final coordinates = LatLng(lat, lng);
            if (mounted) {
              setState(() {
                _selectedLocation = coordinates;
              });
              _updateMapPosition();
              _notifyLocationSelected();
            }
          }
        }
      }
    } catch (e) {
      print('Ошибка геокодирования адреса: $e');
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    final coordinatesText = '${point.latitude.toStringAsFixed(6)}, ${point.longitude.toStringAsFixed(6)}';
    setState(() {
      _selectedLocation = point;
      // Временно показываем координаты, пока не получим адрес
      _selectedAddress = coordinatesText;
      _searchController.text = coordinatesText;
      // Обновляем последний запрос, чтобы подсказки не появлялись после клика на карту
      _lastSearchQuery = coordinatesText;
      _showSuggestions = false;
      _suggestions = [];
    });
    _reverseGeocode(point);
  }

  Future<void> _reverseGeocode(LatLng point) async {
    try {
      // Используем Nominatim API для обратного геокодирования
      final response = await _dio.get<dynamic>(
        'https://nominatim.openstreetmap.org/reverse',
        queryParameters: {
          'lat': point.latitude.toString(),
          'lon': point.longitude.toString(),
          'format': 'json',
          'addressdetails': 1,
          'accept-language': 'ru',
        },
        options: Options(
          headers: {
            'User-Agent': 'AviaPoint App (Flutter)',
          },
          responseType: ResponseType.json,
        ),
      );

      if (!mounted) return;

      String addressText = '${point.latitude.toStringAsFixed(6)}, ${point.longitude.toStringAsFixed(6)}';

      if (response.statusCode == 200 && response.data != null) {
        // Nominatim reverse возвращает объект с полем address
        final data = response.data is Map ? response.data as Map<String, dynamic> : null;
        final address = data?['address'] as Map<String, dynamic>?;
        if (address != null) {
          final displayName = _buildDisplayNameFromAddress(address);
          if (displayName.isNotEmpty) {
            addressText = displayName;
          }
        }
      }

      // Обновляем UI с полученным адресом
      if (mounted) {
        setState(() {
          _selectedAddress = addressText;
          _searchController.text = addressText;
          // Обновляем последний запрос, чтобы подсказки не появлялись после клика на карту
          _lastSearchQuery = addressText;
        });
        _notifyLocationSelected();
      }
    } catch (e) {
      // Если ошибка, показываем координаты
      if (mounted) {
        final coordinatesText = '${point.latitude.toStringAsFixed(6)}, ${point.longitude.toStringAsFixed(6)}';
        setState(() {
          _selectedAddress = coordinatesText;
          _searchController.text = coordinatesText;
        });
        _notifyLocationSelected();
      }
      print('Ошибка обратного геокодинга: $e');
    }
  }

  void _notifyLocationSelected() {
    if (_selectedLocation != null && widget.onLocationSelected != null) {
      widget.onLocationSelected!({
        'address': _selectedAddress ?? '',
        'lat': _selectedLocation!.latitude,
        'lng': _selectedLocation!.longitude,
      });
    }
  }

  void _clearLocation() {
    setState(() {
      _searchController.clear();
      _selectedLocation = null;
      _selectedAddress = null;
      _suggestions = [];
      _showSuggestions = false;
    });
    _searchFocusNode.unfocus();
    // Уведомляем об очистке
    if (widget.onLocationSelected != null) {
      widget.onLocationSelected!({
        'address': '',
        'lat': null,
        'lng': null,
      });
    }
  }

  Widget? _buildSuffixIcon() {
    if (_isLoadingSuggestions) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    
    if (_searchController.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.clear, size: 20),
        onPressed: _clearLocation,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      );
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Поле поиска
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                labelText: 'Местоположение *',
                hintText: 'Введите адрес',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _buildSuffixIcon(),
              ),
              onTap: () {
                // Подсказки показываются только при изменении текста, не при клике на поле
                // Это предотвращает показ подсказок после выбора адреса
              },
            ),
            // Список подсказок
            if (_showSuggestions && _suggestions.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4.h),
                constraints: BoxConstraints(maxHeight: 200.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = _suggestions[index];
                    final displayName = suggestion['displayName'] as String? ?? '';
                    return ListTile(
                      dense: true,
                      leading: const Icon(Icons.location_on, color: AppColors.primary100p, size: 20),
                      title: Text(
                        displayName.isNotEmpty ? displayName : 'Адрес не указан',
                        style: AppStyles.regular14s,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                        onTap: () {
                          _selectSuggestion(suggestion);
                        },
                    );
                  },
                ),
              ),
          ],
        ),
        SizedBox(height: 16.h),
        // Карта
        Container(
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _selectedLocation ?? const LatLng(55.7558, 37.6173), // Москва по умолчанию
                initialZoom: _selectedLocation != null ? 15.0 : 10.0,
                minZoom: 3.0,
                maxZoom: 18.0,
                onTap: _onMapTap,
                onMapReady: () {
                  if (_selectedLocation != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _updateMapPosition();
                    });
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.aviapoint.app',
                  maxZoom: 19,
                ),
                if (_selectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _selectedLocation!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_on,
                          color: AppColors.primary100p,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
