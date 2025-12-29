import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/flights_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/search_bar_widget.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class CreateFlightScreen extends StatefulWidget {
  const CreateFlightScreen({super.key});

  @override
  State<CreateFlightScreen> createState() => _CreateFlightScreenState();
}

class _CreateFlightScreenState extends State<CreateFlightScreen> {
  final _formKey = GlobalKey<FormState>();
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  final _aircraftTypeController = TextEditingController();
  final _descriptionController = TextEditingController();
  int? _selectedSeats;

  late AirportService _airportService;
  
  // Список точек маршрута (включая первую и последнюю)
  final List<_RouteWaypoint> _waypoints = [];
  
  // Контроллеры для полей комментариев (по индексу точки)
  final Map<int, TextEditingController> _commentControllers = {};
  
  // Счетчик для генерации уникальных ID
  int _waypointIdCounter = 0;
  
  // Список фотографий самолета
  final List<XFile> _photos = [];

  @override
  void initState() {
    super.initState();
    final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
    _airportService = AirportService(apiDatasource.dio);
    // Инициализируем маршрут с двумя точками (отправление и прибытие)
    _initRoute();
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
  

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Валидация: минимум 2 точки в маршруте
    if (_waypoints.length < 2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Маршрут должен содержать минимум 2 точки (отправление и прибытие)'), backgroundColor: Colors.red));
      return;
    }

    // Проверяем, что все точки имеют код аэропорта
    for (var i = 0; i < _waypoints.length; i++) {
      final wp = _waypoints[i];
      if (wp.airportCode.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Укажите код аэропорта для точки ${i + 1}'), backgroundColor: Colors.red));
        return;
      }
    }

    // Формируем waypoints из списка точек маршрута
    final List<Map<String, dynamic>> waypoints = [];
    
    for (var entry in _waypoints.asMap().entries) {
      final index = entry.key;
      final wp = entry.value;
      final isFirst = index == 0;
      final isLast = index == _waypoints.length - 1;
      
      // Получаем комментарий из контроллера, если он существует, иначе из waypoint
      final commentText = _commentControllers.containsKey(index) 
          ? (_commentControllers[index]!.text.isEmpty ? null : _commentControllers[index]!.text)
          : wp.comment;
      
      waypoints.add({
        'airport_code': wp.airportCode,
        'sequence_order': index + 1,
        'arrival_time': isFirst ? null : wp.arrivalTime?.toIso8601String(), // Для первой точки arrival_time не нужен
        'departure_time': isLast ? null : wp.departureTime?.toIso8601String(), // Для последней точки departure_time не нужен
        'comment': commentText,
      });
    }

    // Для departureDate используем дату вылета из первой точки, если она указана, иначе текущую дату
    final firstWaypoint = _waypoints.first;
    final departureDate = firstWaypoint.departureTime ?? DateTime.now();
    
    // Создаем полет
    context.read<FlightsBloc>().add(
      CreateFlightEvent(
        departureAirport: _waypoints.first.airportCode,
        arrivalAirport: _waypoints.last.airportCode,
        departureDate: departureDate,
        availableSeats: _selectedSeats ?? 1,
        pricePerSeat: double.parse(_priceController.text.replaceAll(' ', '').replaceAll(',', '.')),
        aircraftType: _aircraftTypeController.text.isNotEmpty ? _aircraftTypeController.text : null,
        description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
        waypoints: waypoints,
        photos: _photos.isNotEmpty ? _photos : null,
      ),
    );
  }
  
  Widget _buildPhotosSection() {
    final hasPhotos = _photos.isNotEmpty;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Фото самолёта/вертолёта', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.0,
            ),
            itemCount: _photos.length,
            itemBuilder: (context, index) {
              final photo = _photos[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Фотография
                    GestureDetector(
                      onTap: () => _showPhotoViewer(context, index),
                      child: kIsWeb
                          ? FutureBuilder<Uint8List>(
                              future: photo.readAsBytes(),
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
                              File(photo.path),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Color(0xFFF3F4F6),
                                child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                              ),
                            ),
                    ),
                    // Кнопка меню в правом верхнем углу
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: PopupMenuButton<String>(
                        icon: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.more_vert, color: Colors.white, size: 18),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        onSelected: (value) {
                          switch (value) {
                            case 'share':
                              _sharePhoto(context, photo);
                              break;
                            case 'download':
                              _downloadPhoto(context, photo);
                              break;
                            case 'delete':
                              _deletePhoto(index);
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem<String>(
                            value: 'share',
                            child: Row(
                              children: [
                                Icon(Icons.share, size: 20, color: Color(0xFF374151)),
                                SizedBox(width: 12.w),
                                Text('Поделиться', style: AppStyles.regular14s),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'download',
                            child: Row(
                              children: [
                                Icon(Icons.download, size: 20, color: Color(0xFF374151)),
                                SizedBox(width: 12.w),
                                Text('Скачать', style: AppStyles.regular14s),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                SizedBox(width: 12.w),
                                Text('Удалить', style: AppStyles.regular14s.copyWith(color: Colors.red)),
                              ],
                            ),
                          ),
                        ],
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
                Text(
                  'Пока нет фотографий',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Future<void> _showUploadPhotosDialog(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (images == null || images.isEmpty) return;

    setState(() {
      _photos.addAll(images);
    });
  }

  void _deletePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(BuildContext mainContext, int initialIndex) {
    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;

    showDialog<void>(
      context: mainContext,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографиями
                PageView.builder(
                  controller: pageController,
                  itemCount: _photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final photo = _photos[index];
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: kIsWeb
                              ? FutureBuilder<Uint8List>(
                                  future: photo.readAsBytes(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Image.memory(
                                        snapshot.data!,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                        height: double.infinity,
                                      );
                                    }
                                    return Container(
                                      color: Colors.black,
                                      child: Center(
                                        child: CircularProgressIndicator(color: Colors.white),
                                      ),
                                    );
                                  },
                                )
                              : Image.file(
                                  File(photo.path),
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                        ),
                      ),
                    );
                  },
                ),
                
                // Верхняя панель с индикатором и кнопками
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Индикатор текущей фотографии
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                '${currentIndex + 1} / ${_photos.length}',
                                style: AppStyles.regular14s.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(mainContext, _photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(mainContext, _photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Удалить"
                                IconButton(
                                  icon: Icon(Icons.delete_outline, color: Colors.red, size: 24),
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop();
                                    _deletePhoto(currentIndex);
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Удалить',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Нижняя панель с навигацией (только если больше 1 фото)
                if (showControls && _photos.length > 1)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Кнопка "Назад"
                            if (currentIndex > 0)
                              IconButton(
                                icon: Icon(Icons.chevron_left, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  shape: CircleBorder(),
                                ),
                              )
                            else
                              SizedBox(width: 48.w),
                            
                            // Индикатор точек
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _photos.length,
                                  (index) => Container(
                                    width: 8.w,
                                    height: 8.w,
                                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Кнопка "Вперед"
                            if (currentIndex < _photos.length - 1)
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  shape: CircleBorder(),
                                ),
                              )
                            else
                              SizedBox(width: 48.w),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sharePhoto(BuildContext context, XFile photo) async {
    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Используйте правую кнопку мыши для сохранения изображения'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Для мобильных платформ
        await Share.shareXFiles([photo], text: 'Фотография самолета');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось поделиться фотографией: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _downloadPhoto(BuildContext context, XFile photo) async {
    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Используйте правую кнопку мыши для сохранения изображения'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Для мобильных платформ - запрашиваем разрешение на запись
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Необходимо разрешение на сохранение файлов'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
          return;
        }

        // Получаем директорию для загрузок
        final directory = await getExternalStorageDirectory();
        if (directory == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Не удалось получить доступ к директории загрузок'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
          return;
        }

        // Копируем файл в директорию загрузок
        final downloadPath = '${directory.path}/Download/${photo.name}';
        final file = File(photo.path);
        await file.copy(downloadPath);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена в загрузки'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось скачать фотографию: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
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
      
      print('🔵 [CreateFlight] Добавлена новая точка с ID=${newWaypoint.id}, индекс=$insertIndex');
      print('🔵 [CreateFlight] Всего точек: ${_waypoints.length + 1}');
      
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
  
  // Инициализация маршрута с первой точкой (отправление)
  void _initRoute() {
    if (_waypoints.isEmpty) {
      setState(() {
        _waypoints.add(_RouteWaypoint(
          id: 'init_${_waypointIdCounter++}',
          airportCode: '',
          airportName: null,
          arrivalTime: null,
          departureTime: null,
          comment: null,
        ));
        // Добавляем вторую точку (прибытие)
        _waypoints.add(_RouteWaypoint(
          id: 'init_${_waypointIdCounter++}',
          airportCode: '',
          airportName: null,
          arrivalTime: null,
          departureTime: null,
          comment: null,
        ));
        // Создаем контроллеры для обеих точек
        _commentControllers[0] = TextEditingController(text: '');
        _commentControllers[1] = TextEditingController(text: '');
      });
    }
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
      // НЕ обновляем контроллер комментария здесь, чтобы не терять фокус
      // Контроллер обновляется только при инициализации через _getCommentController
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    if (!isAuthenticated) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Создать полет', withBack: true),
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64, color: Color(0xFF9CA5AF)),
                SizedBox(height: 16.h),
                Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 8.h),
                Text(
                  'Для создания полета необходимо войти в систему',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocListener<FlightsBloc, FlightsState>(
      listener: (context, state) {
        state.when(
          loading: () {},
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorForUser), backgroundColor: Colors.red, duration: Duration(seconds: 3)),
            );
          },
          success: (flights, airport, departureAirport, arrivalAirport, dateFrom, dateTo) {
            // Успешное создание - навигируем на детальную страницу созданного полета
            if (flights.isNotEmpty) {
              final createdFlight = flights.first;
              // Закрываем экран создания
              Navigator.of(context).pop();
              // Навигируем на детальную страницу созданного полета
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  try {
                    AutoRouter.of(context).push(FlightDetailRoute(flightId: createdFlight.id));
                  } catch (e) {
                    print('Ошибка навигации к деталям полета: $e');
                    // Если навигация не удалась, просто показываем сообщение
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Полет успешно создан'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Полет успешно создан'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              // Если по какой-то причине полет не получен, просто возвращаемся назад
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Полет успешно создан'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Создать полет', withBack: true),
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
                    // Количество мест
                    SizedBox(
                      width: 150.w,
                      child: DropdownButtonFormField<int>(
                        value: _selectedSeats,
                        decoration: InputDecoration(
                          labelText: 'Доступных мест *',
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
                        ),
                        items: List.generate(5, (index) => index + 1).map((seats) {
                          return DropdownMenuItem<int>(
                            value: seats,
                            child: Text('$seats', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedSeats = value;
                            _seatsController.text = value?.toString() ?? '';
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Выберите количество мест';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Цена за место
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Цена за место (₽) *',
                        hintText: 'Например: 5000',
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
                    // Тип самолета (опционально)
                    TextFormField(
                      controller: _aircraftTypeController,
                      decoration: InputDecoration(
                        labelText: 'Тип самолета',
                        hintText: 'Например: Cessna 172',
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
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Секция фотографий самолета
                    _buildPhotosSection(),
                    SizedBox(height: 16.h),
                    // Описание (опционально)
                    Text('Дополнительная информация о полёте', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Описание',
                        hintText: 'Дополнительная информация о полете',
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
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Кнопка создания
                    ElevatedButton(
                      onPressed: isLoading ? null : _submitForm,
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
                          : Text('Создать полет', style: AppStyles.bold16s.copyWith(color: Colors.white)),
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
              label: Text('Добавить промежуточную точку', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
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
                // Всегда берем актуальное значение из списка
                final actualWaypoint = index < _waypoints.length ? _waypoints[index] : waypoint;
                _updateWaypoint(index, _RouteWaypoint(
                  id: actualWaypoint.id, // Сохраняем ID при обновлении
                  airportCode: code,
                  airportName: actualWaypoint.airportName,
                  arrivalTime: actualWaypoint.arrivalTime,
                  departureTime: actualWaypoint.departureTime,
                  comment: actualWaypoint.comment,
                ));
              },
              onRemoved: isFirst || isLast ? null : () => _removeWaypoint(index),
              onUpdated: (updated) {
                // Используем актуальное значение из списка для обновления
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
    // ВСЕГДА получаем актуальное значение из списка, игнорируя параметр waypoint
    if (index >= _waypoints.length) {
      // Если индекс выходит за границы, возвращаем пустой виджет
      return SizedBox.shrink();
    }
    final currentWaypoint = _waypoints[index];
    final currentCode = currentWaypoint.airportCode;
    
    // Отладочная информация для промежуточных точек
    if (index > 0 && index < _waypoints.length - 1) {
      print('🔵 [CreateFlight] Построение карточки промежуточной точки index=$index');
      print('   airportCode="${currentWaypoint.airportCode}"');
      print('   arrivalTime=${currentWaypoint.arrivalTime}');
      print('   departureTime=${currentWaypoint.departureTime}');
      print('   comment="${currentWaypoint.comment}"');
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
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: isFirst || isLast ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppStyles.bold14s.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isFirst ? 'Отправление' : isLast ? 'Прибытие' : 'Промежуточная точка',
                      style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                    ),
                    SizedBox(height: 8.h),
                    SearchBarWidget(
                      key: ValueKey('airport_search_${currentWaypoint.id}_$index'), // Используем ID и индекс для гарантии уникальности
                      initialValue: currentCode.isEmpty || currentCode == '' ? null : currentCode, // Явно проверяем на пустую строку
                      hintText: 'Введите код аэродрома или название',
                      airportService: _airportService,
                      onSelected: onAirportSelected,
                    ),
                  ],
                ),
              ),
              if (!isFirst && !isLast && onRemoved != null)
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: onRemoved,
                ),
            ],
          ),
          // Для первой точки - дата и время вылета и комментарий
          if (isFirst) ...[
            SizedBox(height: 16.h),
            Divider(),
            SizedBox(height: 12.h),
            Text(
              'Укажите дату и время вылета из этого аэропорта',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
            ),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('departure_first_${currentWaypoint.id}_$index'),
              label: 'Дата и время вылета',
              initialDateTime: currentWaypoint.departureTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: dateTime,
                    comment: actualWaypoint.comment,
                  ));
                }
              },
            ),
            SizedBox(height: 12.h),
            // Комментарий
            TextFormField(
              key: ValueKey('comment_first_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                hintText: 'Дополнительная информация о точке',
                filled: true,
                fillColor: Color(0xFFF9FAFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                ),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: value.isEmpty ? null : value,
                  ));
                }
              },
            ),
          ],
          // Для последней точки - дата и время прибытия и комментарий
          if (isLast) ...[
            SizedBox(height: 16.h),
            Divider(),
            SizedBox(height: 12.h),
            Text(
              'Укажите дату и время прибытия в этот аэропорт',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
            ),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('arrival_last_${currentWaypoint.id}_$index'),
              label: 'Дата и время прибытия',
              initialDateTime: currentWaypoint.arrivalTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: dateTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: actualWaypoint.comment,
                  ));
                }
              },
            ),
            SizedBox(height: 12.h),
            // Комментарий
            TextFormField(
              key: ValueKey('comment_last_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                hintText: 'Дополнительная информация о точке',
                filled: true,
                fillColor: Color(0xFFF9FAFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                ),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: value.isEmpty ? null : value,
                  ));
                }
              },
            ),
          ],
          // Для промежуточных точек - дата и время прибытия, отправления и комментарий
          if (!isFirst && !isLast) ...[
            SizedBox(height: 16.h),
            Divider(),
            SizedBox(height: 12.h),
            // Дата и время прибытия
            Text(
              'Укажите дату и время прибытия в этот аэропорт',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
            ),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('arrival_inter_${currentWaypoint.id}_$index'),
              label: 'Дата и время прибытия',
              initialDateTime: currentWaypoint.arrivalTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: dateTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: actualWaypoint.comment,
                  ));
                }
              },
            ),
            SizedBox(height: 12.h),
            // Дата и время отправления
            Text(
              'Укажите дату и время вылета из этого аэропорта',
              style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
            ),
            SizedBox(height: 8.h),
            _buildDateTimeField(
              key: ValueKey('departure_inter_${currentWaypoint.id}_$index'),
              label: 'Дата и время отправления',
              initialDateTime: currentWaypoint.departureTime,
              onDateTimeSelected: (dateTime) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: dateTime,
                    comment: actualWaypoint.comment,
                  ));
                }
              },
            ),
            SizedBox(height: 12.h),
            // Комментарий
            TextFormField(
              key: ValueKey('comment_inter_${currentWaypoint.id}_$index'),
              controller: _getCommentController(index),
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                hintText: 'Дополнительная информация о точке',
                filled: true,
                fillColor: Color(0xFFF9FAFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                ),
              ),
              onChanged: (value) {
                if (onUpdated != null) {
                  // Всегда берем актуальное значение из списка
                  final actualWaypoint = index < _waypoints.length ? _waypoints[index] : currentWaypoint;
                  onUpdated(_RouteWaypoint(
                    id: actualWaypoint.id, // Сохраняем ID
                    airportCode: actualWaypoint.airportCode,
                    airportName: actualWaypoint.airportName,
                    arrivalTime: actualWaypoint.arrivalTime,
                    departureTime: actualWaypoint.departureTime,
                    comment: value.isEmpty ? null : value,
                  ));
                }
              },
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildDateTimeField({
    Key? key,
    required String label,
    DateTime? initialDateTime,
    required void Function(DateTime?) onDateTimeSelected,
  }) {
    return InkWell(
      key: key,
      onTap: () async {
        // Сначала выбираем дату
        final dateResult = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.single,
            selectedDayHighlightColor: Color(0xFF0A6EFA),
            todayTextStyle: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA)),
            selectedDayTextStyle: AppStyles.bold14s.copyWith(color: Colors.white),
          ),
          dialogSize: Size(MediaQuery.of(context).size.width * 0.9, 400),
          value: initialDateTime != null ? [initialDateTime] : [],
        );

        if (dateResult == null || dateResult.isEmpty) return;

        final selectedDate = dateResult.first;
        if (selectedDate == null) return;

        // Затем выбираем время
        final timeResult = await showTimePicker(
          context: context,
          initialTime: initialDateTime != null 
              ? TimeOfDay.fromDateTime(initialDateTime)
              : TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: Color(0xFF0A6EFA))),
              child: child!,
            );
          },
        );

        if (timeResult != null) {
          final dateTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            timeResult.hour,
            timeResult.minute,
          );
          onDateTimeSelected(dateTime);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, size: 18, color: Color(0xFF9CA5AF)),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                initialDateTime != null
                    ? DateFormat('dd.MM.yyyy HH:mm').format(initialDateTime)
                    : 'Выберите дату и время',
                style: AppStyles.regular14s.copyWith(
                  color: initialDateTime != null ? Color(0xFF374151) : Color(0xFF9CA5AF),
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF9CA5AF)),
          ],
        ),
      ),
    );
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

  _RouteWaypoint({
    String? id,
    required this.airportCode,
    this.airportName,
    this.arrivalTime,
    this.departureTime,
    this.comment,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}
