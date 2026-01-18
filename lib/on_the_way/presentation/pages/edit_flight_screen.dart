import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/search_bar_widget.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/core/presentation/widgets/date_time_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:aviapoint/core/utils/const/app.dart';

@RoutePage()
class EditFlightScreen extends StatefulWidget {
  final FlightEntity flight;

  const EditFlightScreen({super.key, required this.flight});

  @override
  State<EditFlightScreen> createState() => _EditFlightScreenState();
}

class _EditFlightScreenState extends State<EditFlightScreen> {
  final _formKey = GlobalKey<FormState>();
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  final _aircraftTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  late AirportService _airportService;

  // Список точек маршрута (включая первую и последнюю)
  final List<_RouteWaypoint> _waypoints = [];

  // Контроллеры для полей комментариев (по индексу точки)
  final Map<int, TextEditingController> _commentControllers = {};

  // Счетчик для генерации уникальных ID
  int _waypointIdCounter = 0;

  // Локальное состояние фотографий
  List<String> _currentPhotos = []; // Текущий список фотографий (URL)
  List<XFile> _photosToAdd = []; // Новые фотографии для добавления
  List<String> _photosToDelete = []; // URL фотографий для удаления

  @override
  void initState() {
    super.initState();
    final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
    _airportService = AirportService(apiDatasource.dio);

    // Предзаполняем поля данными из полета
    _seatsController.text = widget.flight.totalSeats?.toString() ?? widget.flight.availableSeats.toString();
    _priceController.text = widget.flight.pricePerSeat.toStringAsFixed(0);
    _aircraftTypeController.text = widget.flight.aircraftType ?? '';
    _descriptionController.text = widget.flight.description ?? '';

    // Инициализируем waypoints из существующего полета
    _initWaypointsFromFlight();

    // Инициализируем фотографии из существующего полета
    _currentPhotos = List<String>.from(widget.flight.photos ?? []);
  }

  void _initWaypointsFromFlight() {
    if (widget.flight.waypoints != null && widget.flight.waypoints!.isNotEmpty) {
      setState(() {
        for (var i = 0; i < widget.flight.waypoints!.length; i++) {
          final wp = widget.flight.waypoints![i];
          _waypoints.add(
            _RouteWaypoint(
              id: 'waypoint_${wp.id}_${i}_${_waypointIdCounter++}', // Используем ID из БД, индекс и счетчик для уникальности
              airportCode: wp.airportCode,
              airportName: wp.airportName,
              arrivalTime: wp.arrivalTime,
              departureTime: wp.departureTime,
              comment: wp.comment,
            ),
          );
          // Создаем контроллер для комментария
          _commentControllers[i] = TextEditingController(text: wp.comment ?? '');
        }
      });
    } else {
      // Если waypoints нет, создаем из старых полей (для обратной совместимости)
      setState(() {
        _waypoints.add(
          _RouteWaypoint(
            id: 'waypoint_init_${_waypointIdCounter++}',
            airportCode: widget.flight.departureAirport,
            airportName: null,
            arrivalTime: null,
            departureTime: widget.flight.departureDate,
            comment: null,
          ),
        );
        _waypoints.add(
          _RouteWaypoint(id: 'waypoint_init_${_waypointIdCounter++}', airportCode: widget.flight.arrivalAirport, airportName: null, arrivalTime: null, departureTime: null, comment: null),
        );
        _commentControllers[0] = TextEditingController(text: '');
        _commentControllers[1] = TextEditingController(text: '');
      });
    }
  }

  @override
  void dispose() {
    _seatsController.dispose();
    _priceController.dispose();
    _aircraftTypeController.dispose();
    _descriptionController.dispose();
    // Освобождаем все контроллеры комментариев
    for (var controller in _commentControllers.values) {
      controller.dispose();
    }
    _commentControllers.clear();
    super.dispose();
  }

  // Получить или создать контроллер для комментария точки
  TextEditingController _getCommentController(int index) {
    if (!_commentControllers.containsKey(index)) {
      final waypoint = index < _waypoints.length ? _waypoints[index] : null;
      _commentControllers[index] = TextEditingController(text: waypoint?.comment ?? '');
    }
    return _commentControllers[index]!;
  }

  // Проверка валидности формы (все обязательные поля заполнены)
  bool _isFormValid() {
    // Проверяем количество точек маршрута
    if (_waypoints.length < 2) return false;

    // Проверяем, что все точки имеют код аэропорта
    for (var wp in _waypoints) {
      if (wp.airportCode.isEmpty) return false;
    }

    // Проверяем дату отправления (обязательна)
    if (_waypoints.first.departureTime == null) return false;

    // Проверяем количество мест
    final seatsText = _seatsController.text.trim();
    if (seatsText.isEmpty) return false;
    final seats = int.tryParse(seatsText);
    if (seats == null || seats <= 0) return false;

    // Проверяем цену
    final priceText = _priceController.text.trim();
    if (priceText.isEmpty) return false;
    final price = double.tryParse(priceText.replaceAll(' ', '').replaceAll(',', '.'));
    if (price == null || price <= 0) return false;

    // Проверяем тип самолета (обязателен)
    if (_aircraftTypeController.text.trim().isEmpty) return false;

    return true;
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      // Если форма не прошла валидацию, показываем ошибки для незаполненных полей
      _showValidationErrors();
      return;
    }

    // Валидация: минимум 2 точки в маршруте
    if (_waypoints.length < 2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Маршрут должен содержать минимум 2 точки (отправление и прибытие)'), backgroundColor: Colors.red, duration: Duration(seconds: 5)));
      return;
    }

    // Проверяем, что все точки имеют код аэропорта
    for (var i = 0; i < _waypoints.length; i++) {
      final wp = _waypoints[i];
      if (wp.airportCode.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Укажите код аэропорта для точки ${i + 1}'), backgroundColor: Colors.red, duration: Duration(seconds: 5)));
        return;
      }
    }

    // Валидация: дата отправления обязательна
    if (_waypoints.first.departureTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Укажите дату и время вылета'), backgroundColor: Colors.red, duration: Duration(seconds: 5)));
      return;
    }

    // Формируем список waypoints для отправки
    final waypoints = <Map<String, dynamic>>[];
    for (var i = 0; i < _waypoints.length; i++) {
      final wp = _waypoints[i];
      final commentText = _commentControllers[i]?.text ?? wp.comment ?? '';

      waypoints.add({
        'airport_code': wp.airportCode,
        'sequence_order': i + 1,
        'arrival_time': wp.arrivalTime?.toIso8601String(),
        'departure_time': wp.departureTime?.toIso8601String(),
        'comment': commentText.isNotEmpty ? commentText : null,
      });
    }

    // Преобразуем цену в double (будет округлено до int в repository)
    final priceValue = double.parse(_priceController.text.replaceAll(' ', '').replaceAll(',', '.'));

    // Получаем departureDate из первой точки (обязательное поле, уже проверено выше)
    final departureDate = _waypoints.first.departureTime!;

    // Сохраняем изменения полета
    context.read<FlightsBloc>().add(
      UpdateFlightEvent(
        flightId: widget.flight.id,
        departureAirport: _waypoints.first.airportCode,
        arrivalAirport: _waypoints.last.airportCode,
        departureDate: departureDate,
        availableSeats: int.parse(_seatsController.text),
        pricePerSeat: priceValue,
        aircraftType: _aircraftTypeController.text.isNotEmpty ? _aircraftTypeController.text : null,
        description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
        waypoints: waypoints,
      ),
    );
  }

  Future<void> _showAircraftTypeSelector(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AircraftTypeSelectorDialog(initialValue: _aircraftTypeController.text),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _aircraftTypeController.text = result;
      });
    }
  }

  Future<void> _handlePhotoChanges() async {
    try {
      final repository = getIt<OnTheWayRepository>();

      // Удаляем фотографии, если есть
      if (_photosToDelete.isNotEmpty) {
        for (final photoUrl in _photosToDelete) {
          await repository.deleteFlightPhoto(flightId: widget.flight.id, photoUrl: photoUrl);
        }
      }

      // Добавляем новые фотографии, если есть
      if (_photosToAdd.isNotEmpty) {
        await repository.uploadFlightPhotos(flightId: widget.flight.id, photos: _photosToAdd);
      }

      // Очищаем списки после успешного сохранения
      if (mounted) {
        setState(() {
          _photosToAdd.clear();
          _photosToDelete.clear();
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при сохранении фотографий: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
      }
    }
  }

  // Показываем ошибки валидации для незаполненных обязательных полей
  void _showValidationErrors() {
    final errors = <String>[];

    if (_waypoints.length < 2) {
      errors.add('Маршрут должен содержать минимум 2 точки');
    } else {
      for (var i = 0; i < _waypoints.length; i++) {
        if (_waypoints[i].airportCode.isEmpty) {
          errors.add('Укажите код аэропорта для точки ${i + 1}');
        }
      }
    }

    if (_waypoints.isNotEmpty && _waypoints.first.departureTime == null) {
      errors.add('Укажите дату и время вылета');
    }

    final seatsText = _seatsController.text.trim();
    if (seatsText.isEmpty) {
      errors.add('Введите количество мест');
    } else {
      final seats = int.tryParse(seatsText);
      if (seats == null || seats <= 0) {
        errors.add('Количество мест должно быть больше 0');
      }
    }

    final priceText = _priceController.text.trim();
    if (priceText.isEmpty) {
      errors.add('Введите цену за место');
    } else {
      final price = double.tryParse(priceText.replaceAll(' ', '').replaceAll(',', '.'));
      if (price == null || price <= 0) {
        errors.add('Введите корректную цену за место');
      }
    }

    if (_aircraftTypeController.text.trim().isEmpty) {
      errors.add('Введите тип самолета');
    }

    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errors.join('\n')), backgroundColor: Colors.red, duration: Duration(seconds: 5)));
    }
  }

  void _addWaypoint() {
    setState(() {
      // Вставляем новую точку перед последней (прибытием)
      // Если есть только 2 точки (отправление и прибытие), вставляем между ними
      final insertIndex = _waypoints.length > 1 ? _waypoints.length - 1 : _waypoints.length;

      // Создаем новую пустую точку с уникальным ID
      final newWaypoint = _RouteWaypoint(
        id: 'new_${DateTime.now().millisecondsSinceEpoch}_${_waypointIdCounter++}', // Гарантируем уникальность через счетчик
        airportCode: '',
        airportName: null,
        arrivalTime: null,
        departureTime: null,
        comment: null,
      );

      print('🔵 [EditFlight] Добавлена новая точка с ID=${newWaypoint.id}, индекс=$insertIndex');
      print('🔵 [EditFlight] Всего точек: ${_waypoints.length + 1}');

      // Вставляем точку в нужное место
      _waypoints.insert(insertIndex, newWaypoint);

      // Обновляем индексы контроллеров для точек после вставленной
      final controllersToUpdate = <int, TextEditingController>{};
      for (var key in _commentControllers.keys.toList()) {
        if (key >= insertIndex) {
          controllersToUpdate[key + 1] = _commentControllers[key]!;
          _commentControllers.remove(key);
        } else {
          controllersToUpdate[key] = _commentControllers[key]!;
        }
      }
      _commentControllers.clear();
      _commentControllers.addAll(controllersToUpdate);

      // Создаем контроллер для новой точки с пустым текстом
      _commentControllers[insertIndex] = TextEditingController(text: '');
    });
  }

  void _removeWaypoint(int index) {
    setState(() {
      // Удаляем контроллер для удаляемой точки
      _commentControllers[index]?.dispose();
      _commentControllers.remove(index);

      // Обновляем индексы контроллеров для точек после удаленной
      final controllersToUpdate = <int, TextEditingController>{};
      for (var key in _commentControllers.keys.toList()) {
        if (key > index) {
          controllersToUpdate[key - 1] = _commentControllers[key]!;
          _commentControllers.remove(key);
        } else if (key < index) {
          controllersToUpdate[key] = _commentControllers[key]!;
        }
      }
      _commentControllers.clear();
      _commentControllers.addAll(controllersToUpdate);

      _waypoints.removeAt(index);
    });
  }

  void _updateWaypoint(int index, _RouteWaypoint waypoint) {
    setState(() {
      _waypoints[index] = waypoint;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FlightsBloc, FlightsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(responseMessage ?? errorForUser), backgroundColor: Colors.red, duration: Duration(seconds: 4)));
          },
          success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) {
            // Обрабатываем фотографии после успешного обновления полета
            _handlePhotoChanges()
                .then((_) {
                  // После успешного обновления возвращаемся назад
                  if (mounted) {
                    Navigator.of(context).pop(true);
                  }
                })
                .catchError((error) {
                  // Если ошибка при сохранении фотографий, все равно возвращаемся назад
                  if (mounted) {
                    Navigator.of(context).pop(true);
                  }
                });
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Редактировать полет', withBack: true),
        backgroundColor: AppColors.background,
        body: BlocBuilder<FlightsBloc, FlightsState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Секция маршрута с несколькими точками
                    _buildRouteSection(),
                    SizedBox(height: 16.h),
                    // Свободных мест
                    Row(
                      children: [
                        Icon(Icons.event_seat, size: 20, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 12.w),
                        RichText(
                          text: TextSpan(
                            text: 'Свободных мест',
                            style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                            children: [
                              TextSpan(
                                text: ' *',
                                style: AppStyles.regular14s.copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _seatsController,
                      style: AppStyles.regular14s,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}), // Обновляем состояние для перерисовки кнопки
                      decoration: InputDecoration(
                        hintText: 'Введите количество свободных мест',
                        hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите количество свободных мест';
                        }
                        final seats = int.tryParse(value);
                        if (seats == null || seats <= 0) {
                          return 'Количество свободных мест должно быть больше 0';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Цена за место
                    Row(
                      children: [
                        Icon(Icons.attach_money, size: 20, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 12.w),
                        RichText(
                          text: TextSpan(
                            text: 'Цена за место',
                            style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                            children: [
                              TextSpan(
                                text: ' *',
                                style: AppStyles.regular14s.copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _priceController,
                      style: AppStyles.regular14s,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) => setState(() {}), // Обновляем состояние для перерисовки кнопки
                      decoration: InputDecoration(
                        hintText: 'Введите цену за место (₽)',
                        hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите цену за место';
                        }
                        final price = double.tryParse(value.replaceAll(' ', '').replaceAll(',', '.'));
                        if (price == null || price <= 0) {
                          return 'Цена должна быть больше 0';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Модель самолёта
                    Row(
                      children: [
                        Icon(Icons.flight, size: 20, color: Color(0xFF9CA5AF)),
                        SizedBox(width: 12.w),
                        RichText(
                          text: TextSpan(
                            text: 'Модель самолёта',
                            style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                            children: [
                              TextSpan(
                                text: ' *',
                                style: AppStyles.regular14s.copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () => _showAircraftTypeSelector(context),
                      child: TextFormField(
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                        controller: _aircraftTypeController,
                        enabled: false,
                        onChanged: (_) => setState(() {}), // Обновляем состояние для перерисовки кнопки
                        decoration: InputDecoration(
                          hintText: 'Нажмите для выбора типа самолёта',
                          hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF9CA5AF)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите тип самолета';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Дополнительная информация о полёте
                    Text('Дополнительная информация о полёте', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _descriptionController,
                      style: AppStyles.regular14s,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Введите дополнительную информацию о полете',
                        hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Секция фотографий
                    _buildPhotosSection(),
                    SizedBox(height: 24.h),
                    // Кнопка сохранения
                    ElevatedButton(
                      onPressed: (isLoading || !_isFormValid()) ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A6EFA),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                        disabledBackgroundColor: Color(0xFF9CA5AF),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : Text('Сохранить изменения', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRouteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Маршрут', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
            TextButton.icon(
              onPressed: _addWaypoint,
              icon: Icon(Icons.add, size: 18, color: Color(0xFF0A6EFA)),
              label: Text('Добавить точку', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        // Все точки маршрута (включая первую и последнюю)
        ..._waypoints.asMap().entries.map((entry) {
          final index = entry.key;
          final waypoint = entry.value;
          final isFirst = index == 0;
          final isLast = index == _waypoints.length - 1;

          return Padding(
            key: ValueKey('waypoint_padding_${waypoint.id}_$index'), // Используем ID и индекс для гарантии уникальности
            padding: EdgeInsets.only(top: index > 0 ? 12.h : 0),
            child: _buildWaypointCard(
              index: index,
              waypoint: waypoint,
              isFirst: isFirst,
              isLast: isLast,
              onAirportSelected: (code) {
                final actualWaypoint = index < _waypoints.length ? _waypoints[index] : waypoint;
                _updateWaypoint(
                  index,
                  _RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID при обновлении
                    airportCode: code,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: actualWaypoint.comment,
                  ),
                );
              },
              onRemoved: isFirst || isLast ? null : () => _removeWaypoint(index),
              onUpdated: (updated) {
                _updateWaypoint(index, updated);
              },
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildWaypointCard({
    required int index,
    required _RouteWaypoint waypoint,
    bool isFirst = false,
    bool isLast = false,
    required void Function(String) onAirportSelected,
    VoidCallback? onRemoved,
    void Function(_RouteWaypoint)? onUpdated,
  }) {
    if (index >= _waypoints.length) {
      return SizedBox.shrink();
    }
    // ВСЕГДА получаем актуальное значение из списка, игнорируя параметр waypoint
    final currentWaypoint = _waypoints[index];
    final currentCode = currentWaypoint.airportCode;

    // Отладочная информация для промежуточных точек
    if (index > 0 && index < _waypoints.length - 1) {
      print('🔵 [EditFlight] Построение карточки промежуточной точки index=$index, ID=${currentWaypoint.id}');
      print('   airportCode="${currentWaypoint.airportCode}"');
    }

    return Container(
      key: ValueKey('waypoint_card_${currentWaypoint.id}_$index'), // Используем ID и индекс для гарантии уникальности
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFD9E6F8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight), color: isFirst ? Colors.green : (isLast ? Colors.red : Colors.blue), size: 20.r),
                  SizedBox(width: 8.w),
                  RichText(
                    text: TextSpan(
                      text: isFirst
                          ? 'Отправление'
                          : isLast
                          ? 'Прибытие'
                          : 'Промежуточная точка',
                      style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: AppStyles.bold14s.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  if (!isFirst && !isLast && onRemoved != null)
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: onRemoved,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                ],
              ),
              SizedBox(height: 12.h),
              SearchBarWidget(
                key: ValueKey('airport_search_${currentWaypoint.id}_$index'), // Используем ID и индекс для гарантии уникальности
                initialValue: currentCode.isEmpty || currentCode == '' ? null : currentCode, // Явно проверяем на пустую строку
                hintText: 'Введите код аэродрома или название',
                airportService: _airportService,
                onSelected: onAirportSelected,
              ),
            ],
          ),
          // Для первой точки - дата и время вылета и комментарий
          if (isFirst) ...[
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                text: 'Укажите дату и время вылета из этого аэропорта',
                style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                children: [
                  TextSpan(
                    text: ' *',
                    style: AppStyles.regular12s.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('departure_first_${currentWaypoint.id}_$index'),
              label: 'Дата и время вылета *',
              initialDateTime: currentWaypoint.departureTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: actualWaypoint.arrivalTime,
                      departureTime: dateTime,
                      comment: actualWaypoint.comment,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12.h),
            TextFormField(
              key: ValueKey('comment_first_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              style: AppStyles.regular14s,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                hintText: 'Дополнительная информация о точке',
                hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                filled: true,
                fillColor: Color(0xFFF9FAFB),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: actualWaypoint.arrivalTime,
                      departureTime: actualWaypoint.departureTime,
                      comment: value.isEmpty ? null : value,
                    ),
                  );
                }
              },
            ),
          ],
          // Для последней точки - дата и время прибытия и комментарий
          if (isLast) ...[
            SizedBox(height: 16.h),
            Text('Укажите дату и время прибытия в этот аэропорт', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('arrival_last_${currentWaypoint.id}_$index'),
              label: 'Дата и время прибытия',
              initialDateTime: currentWaypoint.arrivalTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: dateTime,
                      departureTime: actualWaypoint.departureTime,
                      comment: actualWaypoint.comment,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12.h),
            TextFormField(
              key: ValueKey('comment_last_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              style: AppStyles.regular14s,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                hintText: 'Дополнительная информация о точке',
                hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                filled: true,
                fillColor: Color(0xFFF9FAFB),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: actualWaypoint.arrivalTime,
                      departureTime: actualWaypoint.departureTime,
                      comment: value.isEmpty ? null : value,
                    ),
                  );
                }
              },
            ),
          ],
          // Для промежуточных точек - дата и время прибытия, отправления и комментарий
          if (!isFirst && !isLast) ...[
            SizedBox(height: 16.h),
            Text('Укажите дату и время прибытия в этот аэропорт', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('arrival_inter_${currentWaypoint.id}_$index'),
              label: 'Дата и время прибытия',
              initialDateTime: currentWaypoint.arrivalTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: dateTime,
                      departureTime: actualWaypoint.departureTime,
                      comment: actualWaypoint.comment,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12.h),
            Text('Укажите дату и время вылета из этого аэропорта', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('departure_inter_${currentWaypoint.id}_$index'),
              label: 'Дата и время отправления',
              initialDateTime: currentWaypoint.departureTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: actualWaypoint.arrivalTime,
                      departureTime: dateTime,
                      comment: actualWaypoint.comment,
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12.h),
            TextFormField(
              key: ValueKey('comment_inter_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              style: AppStyles.regular14s,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                hintText: 'Дополнительная информация о точке',
                hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                filled: true,
                fillColor: Color(0xFFF9FAFB),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(
                    _RouteWaypoint(
                      id: actualWaypoint.id, // Сохраняем ID
                      airportCode: actualWaypoint.airportCode,
                      airportName: actualWaypoint.airportName,
                      arrivalTime: actualWaypoint.arrivalTime,
                      departureTime: actualWaypoint.departureTime,
                      comment: value.isEmpty ? null : value,
                    ),
                  );
                }
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateTimeField({Key? key, required String label, DateTime? initialDateTime, required void Function(DateTime?) onDateTimeSelected}) {
    return DateTimeFieldWidget(fieldKey: key, label: label, initialDateTime: initialDateTime, onDateTimeSelected: onDateTimeSelected);
  }

  Widget _buildPhotosSection() {
    // Объединяем текущие фотографии (исключая удаленные) и новые
    final displayPhotos = <_PhotoItem>[];

    // Добавляем существующие фотографии (кроме удаленных)
    for (final photoUrl in _currentPhotos) {
      if (!_photosToDelete.contains(photoUrl)) {
        displayPhotos.add(_PhotoItem(url: photoUrl, file: null, isNew: false));
      }
    }

    // Добавляем новые фотографии
    for (final photoFile in _photosToAdd) {
      displayPhotos.add(_PhotoItem(url: null, file: photoFile, isNew: true));
    }

    final hasPhotos = displayPhotos.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Фото самолёта/вертолёта', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
            TextButton.icon(
              onPressed: () => _showUploadPhotosDialog(context),
              icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
              label: Text('Добавить', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        if (hasPhotos)
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12.w, mainAxisSpacing: 12.h, childAspectRatio: 1.0),
            itemCount: displayPhotos.length,
            itemBuilder: (context, index) {
              final photoItem = displayPhotos[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    // Изображение занимает всё доступное пространство
                    Positioned.fill(
                      child: photoItem.isNew
                          ? kIsWeb
                                ? FutureBuilder<Uint8List>(
                                    future: photoItem.file!.readAsBytes(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Image.memory(
                                          snapshot.data!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Container(
                                            color: Color(0xFFF3F4F6),
                                            child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                                          ),
                                        );
                                      }
                                      return Container(
                                        color: Color(0xFFF3F4F6),
                                        child: Center(child: CircularProgressIndicator()),
                                      );
                                    },
                                  )
                                : Image.file(
                                    File(photoItem.file!.path),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      color: Color(0xFFF3F4F6),
                                      child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                                    ),
                                  )
                          : CachedNetworkImage(
                              imageUrl: _getImageUrl(photoItem.url!),
                              fit: BoxFit.cover,
                              cacheManager: DefaultCacheManager(),
                              placeholder: (context, url) => Container(
                                color: Color(0xFFF3F4F6),
                                child: Center(child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Color(0xFFF3F4F6),
                                child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                              ),
                            ),
                    ),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: GestureDetector(
                        onTap: () => _deletePhoto(photoItem),
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
            },
          )
        else
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xFFE5E7EB)),
            ),
            child: Column(
              children: [
                Icon(Icons.photo_library_outlined, size: 48, color: Color(0xFF9CA5AF)),
                SizedBox(height: 12.h),
                Text('Пока нет фотографий', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
              ],
            ),
          ),
      ],
    );
  }

  String _getImageUrl(String photoUrl) {
    if (photoUrl.startsWith('http://') || photoUrl.startsWith('https://')) {
      return photoUrl;
    }
    return '${getBackUrl(useLocal: true)}/$photoUrl';
  }

  Future<void> _showUploadPhotosDialog(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

    if (images == null || images.isEmpty) return;

    // Добавляем фотографии в локальный список (не сохраняем в БД сразу)
    setState(() {
      _photosToAdd.addAll(images);
    });

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Фотографии добавлены. Нажмите "Сохранить" для применения изменений.'), backgroundColor: Colors.blue, duration: Duration(seconds: 2)));
    }
  }

  Future<void> _deletePhoto(_PhotoItem photoItem) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: Text('Отмена')),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Удаляем из локального состояния (не сохраняем в БД сразу)
    setState(() {
      if (photoItem.isNew) {
        // Если это новая фотография, просто удаляем из списка для добавления
        _photosToAdd.removeWhere((file) => file.path == photoItem.file?.path);
      } else {
        // Если это существующая фотография, помечаем для удаления
        if (photoItem.url != null && !_photosToDelete.contains(photoItem.url)) {
          _photosToDelete.add(photoItem.url!);
        }
      }
    });

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Фотография помечена для удаления. Нажмите "Сохранить" для применения изменений.'), backgroundColor: Colors.blue, duration: Duration(seconds: 2)));
    }
  }
}

/// Модель для точки маршрута в UI
class _RouteWaypoint {
  final String id; // Уникальный идентификатор для правильной идентификации виджетов
  final String airportCode;
  final String? airportName;
  final DateTime? arrivalTime;
  final DateTime? departureTime;
  final String? comment;

  _RouteWaypoint({String? id, required this.airportCode, this.airportName, this.arrivalTime, this.departureTime, this.comment}) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}

/// Вспомогательный класс для хранения информации о фотографии
class _PhotoItem {
  final String? url;
  final XFile? file;
  final bool isNew;

  _PhotoItem({this.url, this.file, required this.isNew}) : assert((url != null && !isNew) || (file != null && isNew), 'Either url or file must be provided');
}
