import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/data/models/airport_model.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class EditAirportScreen extends StatefulWidget {
  final String airportCode;

  const EditAirportScreen({super.key, required this.airportCode});

  @override
  State<EditAirportScreen> createState() => _EditAirportScreenState();
}

class _EditAirportScreenState extends State<EditAirportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameEngController = TextEditingController();
  final _cityController = TextEditingController();
  final _regionController = TextEditingController();
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _notesController = TextEditingController();
  final _runwayLengthController = TextEditingController();
  final _runwayWidthController = TextEditingController();
  final _runwaySurfaceController = TextEditingController();
  final _runwayNameController = TextEditingController();

  AirportModel? _airport;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _error;

  // Локальное состояние фотографий
  List<String> _currentPhotos = []; // Текущий список фотографий (URL)
  List<XFile> _photosToAdd = []; // Новые фотографии для добавления
  List<String> _photosToDelete = []; // URL фотографий для удаления

  @override
  void initState() {
    super.initState();
    _loadAirport();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameEngController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _notesController.dispose();
    _runwayLengthController.dispose();
    _runwayWidthController.dispose();
    _runwaySurfaceController.dispose();
    _runwayNameController.dispose();
    super.dispose();
  }

  Future<void> _loadAirport() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Используем существующий экземпляр ApiDatasource из getIt, который уже настроен с токенами
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final airportService = AirportService(dataSource.dio);
      final airport = await airportService.getAirportByCode(widget.airportCode);

      if (mounted) {
        if (airport == null) {
          setState(() {
            _isLoading = false;
            _error = 'Аэропорт не найден';
          });
          return;
        }

        setState(() {
          _airport = airport;
          _isLoading = false;
          // Предзаполняем поля
          _nameController.text = airport.name;
          _nameEngController.text = airport.nameEng ?? '';
          _cityController.text = airport.city ?? '';
          _regionController.text = airport.region ?? '';
          _emailController.text = airport.email ?? '';
          _websiteController.text = airport.website ?? '';
          _notesController.text = airport.notes ?? '';
          _runwayLengthController.text = airport.runwayLength?.toString() ?? '';
          _runwayWidthController.text = airport.runwayWidth?.toString() ?? '';
          _runwaySurfaceController.text = airport.runwaySurface ?? '';
          _runwayNameController.text = airport.runwayName ?? '';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = 'Ошибка загрузки: $e';
        });
      }
    }
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      // Используем существующий экземпляр ApiDatasource из getIt, который уже настроен с токенами
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final dio = dataSource.dio;

      final data = <String, dynamic>{};

      // Добавляем только измененные поля
      if (_nameController.text != _airport?.name) {
        data['name'] = _nameController.text;
      }
      if (_nameEngController.text != (_airport?.nameEng ?? '')) {
        data['name_eng'] = _nameEngController.text.isEmpty ? null : _nameEngController.text;
      }
      if (_cityController.text != (_airport?.city ?? '')) {
        data['city'] = _cityController.text.isEmpty ? null : _cityController.text;
      }
      if (_regionController.text != (_airport?.region ?? '')) {
        data['region'] = _regionController.text.isEmpty ? null : _regionController.text;
      }
      if (_emailController.text != (_airport?.email ?? '')) {
        data['email'] = _emailController.text.isEmpty ? null : _emailController.text;
      }
      if (_websiteController.text != (_airport?.website ?? '')) {
        data['website'] = _websiteController.text.isEmpty ? null : _websiteController.text;
      }
      if (_notesController.text != (_airport?.notes ?? '')) {
        data['notes'] = _notesController.text.isEmpty ? null : _notesController.text;
      }

      // ВПП
      final runwayLength = int.tryParse(_runwayLengthController.text);
      if (runwayLength != null && runwayLength != (_airport?.runwayLength ?? 0)) {
        data['runway_length'] = runwayLength;
      }

      final runwayWidth = int.tryParse(_runwayWidthController.text);
      if (runwayWidth != null && runwayWidth != (_airport?.runwayWidth ?? 0)) {
        data['runway_width'] = runwayWidth;
      }

      if (_runwaySurfaceController.text != (_airport?.runwaySurface ?? '')) {
        data['runway_surface'] = _runwaySurfaceController.text.isEmpty ? null : _runwaySurfaceController.text;
      }

      if (_runwayNameController.text != (_airport?.runwayName ?? '')) {
        data['runway_name'] = _runwayNameController.text.isEmpty ? null : _runwayNameController.text;
      }

      // Проверяем, есть ли изменения в текстовых полях или фотографиях
      final hasPhotoChanges = _photosToAdd.isNotEmpty || _photosToDelete.isNotEmpty;

      if (data.isEmpty && !hasPhotoChanges) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Нет изменений для сохранения')));
          setState(() {
            _isSaving = false;
          });
        }
        return;
      }

      // Сохраняем текстовые поля, если есть изменения
      if (data.isNotEmpty) {
        await dio.put<Map<String, dynamic>>('/api/airports/${widget.airportCode}', data: data);
      }

      // Удаляем фотографии, если есть
      if (_photosToDelete.isNotEmpty) {
        for (final photoUrl in _photosToDelete) {
          try {
            await dio.delete<Map<String, dynamic>>(
              '/api/airports/${widget.airportCode}/photos',
              data: {'photo_url': photoUrl},
            );
          } catch (e) {
            print('Ошибка при удалении фотографии $photoUrl: $e');
          }
        }
      }

      // Добавляем новые фотографии, если есть
      if (_photosToAdd.isNotEmpty) {
        final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
        final airportService = AirportService(dataSource.dio);

        await airportService.uploadAirportPhotos(airportCode: widget.airportCode, photos: _photosToAdd);
      }

      // Обновляем данные аэропорта после сохранения
      await _loadAirport();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Изменения успешно сохранены'), backgroundColor: Color(0xFF10B981)));

        // Закрываем экран редактирования после успешного сохранения
        Navigator.of(context).pop(true);

        // Открываем bottom sheet с информацией об аэропорте
        await showAirportInfoBottomSheet(context, widget.airportCode);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка сохранения: ${e.toString()}'), backgroundColor: Color(0xFFEF4444)),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _airport != null ? _getTitleForAirport(_airport!) : 'Редактировать аэродром',
        withBack: true,
      ),
      backgroundColor: AppColors.background,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Color(0xFFEF4444), size: 48),
                  SizedBox(height: 16.h),
                  Text(_error!, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  SizedBox(height: 16.h),
                  ElevatedButton(onPressed: _loadAirport, child: Text('Повторить')),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Информация о коде (не редактируется)
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(color: Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Color(0xFF6B7280)),
                          SizedBox(width: 8.w),
                          Text(
                            'Код ICAO: ${_airport?.code} (не редактируется)',
                            style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Название
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Название *',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Поле обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Название (англ.)
                    TextFormField(
                      controller: _nameEngController,
                      decoration: InputDecoration(
                        labelText: 'Название (англ.)',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Город
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'Город',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Регион
                    TextFormField(
                      controller: _regionController,
                      decoration: InputDecoration(
                        labelText: 'Регион',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Введите корректный email';
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Веб-сайт
                    TextFormField(
                      controller: _websiteController,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        labelText: 'Веб-сайт',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Заметки
                    TextFormField(
                      controller: _notesController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Заметки',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // ВПП
                    Text('Взлётно-посадочная полоса', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _runwayNameController,
                      decoration: InputDecoration(
                        labelText: 'Название ВПП',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _runwayLengthController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Длина ВПП (футы)',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _runwayWidthController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Ширина ВПП (футы)',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    TextFormField(
                      controller: _runwaySurfaceController,
                      decoration: InputDecoration(
                        labelText: 'Покрытие ВПП',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    // Секция официальных фотографий
                    _buildOfficialPhotosSection(),
                    SizedBox(height: 32.h),
                    // Кнопка сохранения
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A6EFA),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: _isSaving
                            ? SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text('Сохранить изменения', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
    );
  }

  String _getTitleForAirport(AirportModel airport) {
    final typeLower = airport.type.toLowerCase();
    if (typeLower == 'heliport' ||
        typeLower == 'вертодром' ||
        typeLower.contains('heliport') ||
        typeLower.contains('вертодром')) {
      return 'Редактировать вертодром';
    }
    return 'Редактировать аэродром';
  }

  Widget _buildOfficialPhotosSection() {
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
            Text('Официальные фото', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
            TextButton.icon(
              onPressed: () => _showUploadPhotosDialog(context),
              icon: Icon(Icons.add_photo_alternate, size: 18, color: Color(0xFF0A6EFA)),
              label: Text('Добавить', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
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
                              cacheManager: GetIt.instance<DefaultCacheManager>(),
                              cacheKey: photoItem.url!,
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
                Text('Пока нет официальных фотографий', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Фотографии добавлены. Нажмите "Сохранить" для применения изменений.'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      );
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Фотография помечена для удаления. Нажмите "Сохранить" для применения изменений.'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

/// Вспомогательный класс для хранения информации о фотографии
class _PhotoItem {
  final String? url;
  final XFile? file;
  final bool isNew;

  _PhotoItem({this.url, this.file, required this.isNew})
    : assert((url != null && !isNew) || (file != null && isNew), 'Either url or file must be provided');
}
