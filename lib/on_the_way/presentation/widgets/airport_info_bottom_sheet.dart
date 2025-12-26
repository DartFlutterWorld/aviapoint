import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/utils/pending_actions.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/on_the_way/data/datasources/airport_service.dart';
import 'package:aviapoint/on_the_way/data/models/airport_model.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/feedback_bottom_sheet.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_ownership_request_bottom_sheet.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AirportInfoBottomSheet extends StatefulWidget {
  final String airportCode;

  const AirportInfoBottomSheet({super.key, required this.airportCode});

  @override
  State<AirportInfoBottomSheet> createState() => _AirportInfoBottomSheetState();
}

class _AirportInfoBottomSheetState extends State<AirportInfoBottomSheet> {
  AirportModel? _airport;
  bool _isLoading = true;
  String? _error;
  bool? _isOwner;
  bool _isCheckingOwner = false;

  @override
  void initState() {
    super.initState();
    _loadAirport().then((_) {
      // Проверяем владельца после загрузки аэропорта
      _checkIfOwner();
    });
  }

  Future<void> _checkIfOwner() async {
    final appState = Provider.of<AppState>(context, listen: false);
    if (!appState.isAuthenticated) {
      return;
    }

    setState(() {
      _isCheckingOwner = true;
    });

    try {
      // Проверяем, загружен ли профиль
      final profileBloc = context.read<ProfileBloc>();
      final profileState = profileBloc.state;
      
      // Если профиль не загружен или в состоянии ошибки, загружаем его
      if (profileState is! SuccessProfileState) {
        profileBloc.add(const GetProfileEvent());
        
        // Ждем загрузки профиля (максимум 5 секунд)
        await Future.any<dynamic>([
          profileBloc.stream.firstWhere(
            (state) => state is SuccessProfileState || state is ErrorProfileState,
          ),
          Future<dynamic>.delayed(const Duration(seconds: 5)),
        ]);
      }

      // Проверяем владельца через профиль
      final currentProfileState = profileBloc.state;
      if (currentProfileState is SuccessProfileState && _airport != null) {
        final profile = currentProfileState.profile;
        final ownedAirports = profile.ownedAirports;
        
        // Проверяем, есть ли ID аэропорта в списке owned_airports
        final isOwner = ownedAirports != null && ownedAirports.contains(_airport!.id);
        
        if (mounted) {
          setState(() {
            _isOwner = isOwner;
            _isCheckingOwner = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _isOwner = false;
            _isCheckingOwner = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isOwner = false;
          _isCheckingOwner = false;
        });
      }
    }
  }

  Future<void> _loadAirport() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Создаем AirportService напрямую
      final dataSource = ApiDatasourceDio(baseUrl: getBackUrl(useLocal: true));
      final airportService = AirportService(dataSource.dio);
      
      final airport = await airportService.getAirportByCode(widget.airportCode);
      
      if (mounted) {
        setState(() {
          _airport = airport;
          _isLoading = false;
          if (airport == null) {
            _error = 'Аэропорт не найден';
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = 'Ошибка загрузки данных: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // При успешной загрузке профиля перепроверяем владельца
        if (state is SuccessProfileState && _airport != null) {
          _checkIfOwner();
        }
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // При успешной авторизации перепроверяем владельца
          if (state is SuccessAuthState && _airport != null) {
            // Сначала загружаем профиль, затем проверяем владельца
            context.read<ProfileBloc>().add(const GetProfileEvent());
          }
        },
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          // Заголовок
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _airport != null ? _getTitleForAirport(_airport!) : 'Информация об аэропорте',
                style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Контент
          if (_isLoading)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_error != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Column(
                children: [
                  Icon(Icons.error_outline, color: Color(0xFFEF4444), size: 48),
                  SizedBox(height: 16.h),
                  Text(_error!, style: AppStyles.regular14s.copyWith(color: Color(0xFFEF4444))),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: _loadAirport,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0A6EFA),
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    ),
                    child: Text('Повторить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                  ),
                ],
              ),
            )
          else if (_airport != null)
            Flexible(
              child: SingleChildScrollView(
                child: _buildAirportInfo(_airport!),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildAirportInfo(AirportModel airport) {
    // Определяем иконку и цвет в зависимости от типа
    IconData iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
    Color iconColor = Color(0xFF0A6EFA);
    final typeLower = airport.type.toLowerCase();
    if (typeLower == 'heliport' || 
        typeLower == 'вертодром' ||
        typeLower.contains('heliport') || 
        typeLower.contains('вертодром')) {
      iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
      iconColor = Color(0xFF10B981);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Основная информация
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Первая строка: иконка, код и статус справа
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(iconData, color: Colors.white, size: 32.r),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              airport.code,
                              style: AppStyles.bold20s.copyWith(color: iconColor),
                            ),
                            if (airport.identRu != null && airport.identRu != airport.code) ...[
                              SizedBox(width: 8.w),
                              Text(
                                '(${airport.identRu})',
                                style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                              ),
                            ],
                            if (airport.isInternational) ...[
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                  color: Color(0xFF0A6EFA).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  'INT',
                                  style: AppStyles.medium10s.copyWith(
                                    color: Color(0xFF0A6EFA),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Статус активности в правом верхнем углу
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: airport.isActive
                          ? Color(0xFF10B981).withOpacity(0.1)
                          : Color(0xFFEF4444).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      airport.isActive ? 'Действующий' : 'Недействующий',
                      style: AppStyles.medium10s.copyWith(
                        color: airport.isActive ? Color(0xFF10B981) : Color(0xFFEF4444),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              // Название аэропорта
              Padding(
                padding: EdgeInsets.only(left: 60.w), // Отступ для выравнивания с кодом
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airport.name,
                      style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                    ),
                    if (airport.nameEng != null && airport.nameEng!.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Text(
                        airport.nameEng!,
                        style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        // Расположение
        _buildSection(
          title: 'Расположение',
          children: [
            if (airport.city != null)
              _buildInfoRow(Icons.location_city, 'Город', airport.city!),
            if (airport.region != null)
              _buildInfoRow(Icons.map, 'Регион', airport.region!),
            if (airport.regionEng != null && airport.regionEng != airport.region)
              _buildInfoRow(Icons.map, 'Регион (англ.)', airport.regionEng!),
            if (airport.country != null)
              _buildInfoRow(Icons.public, 'Страна', airport.country!),
            if (airport.countryEng != null && airport.countryEng != airport.country)
              _buildInfoRow(Icons.public, 'Страна (англ.)', airport.countryEng!),
            if (airport.countryCode != null)
              _buildInfoRow(Icons.flag, 'Код страны', airport.countryCode!),
            if (airport.continent != null)
              _buildInfoRow(Icons.language, 'Континент', airport.continent!),
          ],
        ),
        // Координаты
        if (airport.latitudeDeg != null && airport.longitudeDeg != null) ...[
          SizedBox(height: 16.h),
          _buildSection(
            title: 'Координаты',
            children: [
              _buildInfoRow(
                Icons.location_on,
                'Широта',
                '${airport.latitudeDeg!.toStringAsFixed(6)}°',
              ),
              _buildInfoRow(
                Icons.location_on,
                'Долгота',
                '${airport.longitudeDeg!.toStringAsFixed(6)}°',
              ),
              if (airport.elevationFt != null)
                _buildInfoRow(
                  Icons.height,
                  'Высота над уровнем моря',
                  '${airport.elevationFt} футов (${(airport.elevationFt! * 0.3048).toStringAsFixed(0)} м)',
                ),
              if (airport.coordinatesText != null)
                _buildInfoRow(Icons.description, 'КТА', airport.coordinatesText!),
            ],
          ),
        ],
        // Коды
        SizedBox(height: 16.h),
        _buildSection(
          title: 'Коды',
          children: [
            _buildInfoRow(Icons.tag, 'ICAO', airport.code),
            if (airport.iataCode != null)
              _buildInfoRow(Icons.tag, 'IATA', airport.iataCode!),
            if (airport.gpsCode != null)
              _buildInfoRow(Icons.tag, 'GPS', airport.gpsCode!),
            if (airport.localCode != null)
              _buildInfoRow(Icons.tag, 'Локальный', airport.localCode!),
          ],
        ),
        // Тип и характеристики
        SizedBox(height: 16.h),
        _buildSection(
          title: 'Характеристики',
          children: [
            _buildInfoRow(Icons.flight, 'Тип', airport.typeDisplay),
            if (airport.ownership != null)
              _buildInfoRow(Icons.business, 'Принадлежность', airport.ownership!),
            _buildInfoRow(
              Icons.check_circle,
              'Статус',
              airport.isActive ? 'Действующий' : 'Недействующий',
            ),
            if (airport.isVerified)
              _buildInfoRow(Icons.verified, 'Верификация', 'Проверен'),
            if (airport.source != null)
              _buildInfoRow(Icons.source, 'Источник данных', airport.source!),
          ],
        ),
        // Услуги
        if (airport.services != null && airport.services!.isNotEmpty) ...[
          SizedBox(height: 16.h),
          _buildSection(
            title: 'Услуги',
            children: [
              ...airport.services!.entries.map((entry) {
                String value = entry.value.toString();
                if (entry.value is bool) {
                  value = entry.value ? 'Да' : 'Нет';
                }
                return _buildInfoRow(Icons.build, entry.key, value);
              }),
            ],
          ),
        ],
        // ВПП
        if (airport.runwayName != null ||
            airport.runwayLength != null ||
            airport.runwayWidth != null ||
            airport.runwaySurface != null) ...[
          SizedBox(height: 16.h),
          _buildSection(
            title: 'Взлётно-посадочная полоса',
            children: [
              if (airport.runwayName != null)
                _buildInfoRow(Icons.straighten, 'Название', airport.runwayName!),
              if (airport.runwayLength != null)
                _buildInfoRow(
                  Icons.straighten,
                  'Длина',
                  '${airport.runwayLength} футов (${(airport.runwayLength! * 0.3048).toStringAsFixed(0)} м)',
                ),
              if (airport.runwayWidth != null)
                _buildInfoRow(
                  Icons.straighten,
                  'Ширина',
                  '${airport.runwayWidth} футов (${(airport.runwayWidth! * 0.3048).toStringAsFixed(0)} м)',
                ),
              if (airport.runwaySurface != null)
                _buildInfoRow(Icons.landscape, 'Покрытие', airport.runwaySurface!),
              if (airport.runwayMagneticCourse != null)
                _buildInfoRow(Icons.explore, 'Магнитный курс', airport.runwayMagneticCourse!),
              if (airport.runwayLighting != null)
                _buildInfoRow(Icons.lightbulb, 'Освещение', airport.runwayLighting!),
            ],
          ),
        ],
        // Контакты
        if (airport.email != null || airport.website != null) ...[
          SizedBox(height: 16.h),
          _buildSection(
            title: 'Контакты',
            children: [
              if (airport.email != null)
                _buildInfoRow(Icons.email, 'Email', airport.email!),
              if (airport.website != null)
                _buildInfoRow(Icons.language, 'Веб-сайт', airport.website!),
            ],
          ),
        ],
        // Заметки
        if (airport.notes != null && airport.notes!.isNotEmpty) ...[
          SizedBox(height: 16.h),
          _buildSection(
            title: 'Заметки',
            children: [
              Text(
                airport.notes!,
                style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
              ),
            ],
          ),
        ],
        // Официальные фотографии аэропорта
        if (airport.photos != null && airport.photos!.isNotEmpty) ...[
          SizedBox(height: 24.h),
          _buildPhotosSection(airport),
        ],
        // Фото посетителей
        SizedBox(height: 24.h),
        _buildVisitorPhotosSection(airport),
        // Информация для владельцев
        SizedBox(height: 24.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Color(0xFFF0F9FF),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFF0A6EFA).withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Color(0xFF0A6EFA), size: 20),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Если вы владелец, то вы можете управлять данными на этой странице',
                  style: AppStyles.regular12s.copyWith(color: Color(0xFF374151)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        // Кнопка "Я владелец" или "Редактировать"
        if (_isCheckingOwner)
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: CircularProgressIndicator(),
              ),
            ),
          )
        else if (_isOwner == true)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем bottom sheet
                // Используем AutoRouter для навигации
                AutoRouter.of(context).push(EditAirportRoute(airportCode: airport.code));
              },
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text(
                'Редактировать',
                style: AppStyles.bold14s.copyWith(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A6EFA),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          )
        else
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                final appState = Provider.of<AppState>(context, listen: false);
                if (!appState.isAuthenticated) {
                  // Если не авторизован, сохраняем информацию о заявке и открываем авторизацию
                  PendingActions.setPendingOwnershipRequest(airport.code);
                  Navigator.of(context).pop(); // Закрываем bottom sheet
                  
                  // Показываем экран авторизации
                  await showCupertinoModalBottomSheet<bool>(
                    barrierColor: Colors.black12,
                    topRadius: const Radius.circular(20),
                    context: context,
                    builder: (context) => PhoneAuthScreen(),
                  );
                  
                  // После закрытия экрана авторизации проверяем, авторизован ли пользователь
                  // Если да, форма заявки откроется автоматически через BlocListener в app.dart
                  return;
                }

                Navigator.of(context).pop(); // Закрываем текущий bottom sheet
                showAirportOwnershipRequestBottomSheet(
                  context,
                  airportCode: airport.code,
                );
              },
              icon: Icon(Icons.business, color: Color(0xFF0A6EFA)),
              label: Text(
                'Я владелец',
                style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA)),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: BorderSide(color: Color(0xFF0A6EFA)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
        SizedBox(height: 12.h),
        // Кнопка обратной связи
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(); // Закрываем текущий bottom sheet
              showFeedbackBottomSheet(
                context,
                sourcePage: 'airport_info',
                airportCode: airport.code,
              );
            },
            icon: Icon(Icons.report_problem, color: Color(0xFF0A6EFA)),
            label: Text(
              'Сообщить о неточности',
              style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA)),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              side: BorderSide(color: Color(0xFF0A6EFA)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildPhotosSection(AirportModel airport) {
    final hasPhotos = airport.photos != null && airport.photos!.isNotEmpty;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Фотографии', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
            // Кнопка загрузки фотографий (только для владельцев)
            if (_isOwner == true)
              TextButton.icon(
                onPressed: () => _showUploadPhotosDialog(context, airport),
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
            itemCount: airport.photos!.length,
            itemBuilder: (context, index) {
              final photoUrl = airport.photos![index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Фотография
                  GestureDetector(
                    onTap: () => _showPhotoViewer(context, airport, airport.photos!, index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl: getImageUrl(photoUrl),
                        fit: BoxFit.cover,
                        cacheManager: GetIt.instance<DefaultCacheManager>(),
                        cacheKey: photoUrl,
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
                            _sharePhoto(context, photoUrl);
                            break;
                          case 'download':
                            _downloadPhoto(context, photoUrl);
                            break;
                          case 'delete':
                            if (_isOwner == true) {
                              _deletePhotoFromList(context, airport, photoUrl);
                            }
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'share',
                          child: Row(
                            children: [
                              Icon(Icons.share, size: 20, color: Color(0xFF374151)),
                              SizedBox(width: 12.w),
                              Text('Поделиться', style: AppStyles.regular14s),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'download',
                          child: Row(
                            children: [
                              Icon(Icons.download, size: 20, color: Color(0xFF374151)),
                              SizedBox(width: 12.w),
                              Text('Скачать', style: AppStyles.regular14s),
                            ],
                          ),
                        ),
                        if (_isOwner == true)
                          PopupMenuItem(
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

  String _getTitleForAirport(AirportModel airport) {
    final typeLower = airport.type.toLowerCase();
    if (typeLower == 'heliport' || 
        typeLower == 'вертодром' ||
        typeLower.contains('heliport') || 
        typeLower.contains('вертодром')) {
      return 'Информация о вертодроме';
    }
    return 'Информация об аэродроме';
  }

  String getImageUrl(String photoUrl) {
    if (photoUrl.startsWith('http://') || photoUrl.startsWith('https://')) {
      return photoUrl;
    }
    return '${getBackUrl(useLocal: true)}/$photoUrl';
  }


  Widget _buildSection({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Color(0xFF9CA5AF)),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Диалог для загрузки фотографий
  void _showUploadPhotosDialog(BuildContext context, AirportModel airport) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (images == null || images.isEmpty) return;

    // Показываем индикатор загрузки
    BuildContext? dialogContext;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text('Загрузка фотографий...', style: AppStyles.regular14s),
            ],
          ),
        );
      },
    );

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final airportService = AirportService(dataSource.dio);
      
      await airportService.uploadAirportPhotos(
        airportCode: airport.code,
        photos: images,
      );

      // Закрываем диалог загрузки перед обработкой результата
      if (dialogContext != null && Navigator.of(dialogContext!).canPop()) {
        Navigator.of(dialogContext!).pop();
      } else if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      // Сохраняем ScaffoldMessenger до асинхронных операций
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      // Обновляем данные аэропорта
      await _loadAirport();

      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотографии успешно загружены'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Закрываем диалог загрузки в случае ошибки
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
      if (mounted) {
        // Сохраняем ScaffoldMessenger для блока catch
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Ошибка при загрузке фотографий: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ),
        );
      }
    }
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(BuildContext mainContext, AirportModel airport, List<String> photos, int initialIndex) {
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
                  itemCount: photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(photos[index]),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            cacheKey: photos[index],
                            placeholder: (context, url) => Container(
                              color: Colors.black,
                              child: Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16.h),
                                    Text(
                                      'Не удалось загрузить изображение',
                                      style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                
                // Верхняя панель с индикатором и кнопкой закрытия
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
                                '${currentIndex + 1} / ${photos.length}',
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
                                  onPressed: () => _sharePhoto(mainContext, photos[currentIndex]),
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
                                  onPressed: () => _downloadPhoto(mainContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                if (_isOwner == true) ...[
                                  SizedBox(width: 8.w),
                                  // Кнопка "Удалить" (только для владельца)
                                  IconButton(
                                    icon: Icon(Icons.delete_outline, color: Colors.red, size: 24),
                                    onPressed: () => _deletePhoto(mainContext, dialogContext, airport, photos[currentIndex], currentIndex, photos, setState, pageController),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Удалить',
                                  ),
                                ],
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
                if (showControls && photos.length > 1)
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
                                  photos.length,
                                  (index) => Container(
                                    width: 6.w,
                                    height: 6.w,
                                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == currentIndex
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Кнопка "Вперед"
                            if (currentIndex < photos.length - 1)
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

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    // Сохраняем ScaffoldMessenger до асинхронных операций
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться фотографией: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Для мобильных платформ - скачиваем файл
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Необходимо разрешение на сохранение файлов'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16.w),
              Text('Скачивание...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Для Android используем Downloads, для iOS - Photos
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      if (directory != null) {
        final downloadPath = Platform.isAndroid
            ? '${directory.path}/Download/$fileName'
            : '${directory.path}/$fileName';

        final file = File(filePath);
        await file.copy(downloadPath);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Фотография сохранена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось скачать фотографию: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  /// Удалить фотографию из списка
  Future<void> _deletePhotoFromList(BuildContext context, AirportModel airport, String photoUrl) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Сохраняем ScaffoldMessenger до асинхронных операций
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final dio = dataSource.dio;

      await dio.delete<Map<String, dynamic>>(
        '/api/airports/${airport.code}/photos',
        data: {'photo_url': photoUrl},
      );

      // Обновляем данные аэропорта
      await _loadAirport();

      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография успешно удалена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось удалить фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Удалить фотографию из просмотра
  Future<void> _deletePhoto(
    BuildContext mainContext,
    BuildContext dialogContext,
    AirportModel airport,
    String photoUrl,
    int currentIndex,
    List<String> photos,
    StateSetter setState,
    PageController pageController,
  ) async {
    final confirmed = await showDialog<bool>(
      context: mainContext,
      builder: (dialogBuilderContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(false),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final dio = dataSource.dio;

      await dio.delete<Map<String, dynamic>>(
        '/api/airports/${airport.code}/photos',
        data: {'photo_url': photoUrl},
      );

      // Если это последняя фотография, закрываем просмотр
      if (photos.length == 1) {
        if (Navigator.of(dialogContext).canPop()) {
          Navigator.of(dialogContext).pop();
        }
      } else {
        // Переходим на предыдущую или следующую фотографию
        if (currentIndex > 0) {
          pageController.previousPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else if (currentIndex < photos.length - 1) {
          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }

      // Обновляем данные аэропорта
      await _loadAirport();

      if (mainContext.mounted) {
        ScaffoldMessenger.of(mainContext).showSnackBar(
          SnackBar(
            content: Text('Фотография успешно удалена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mainContext.mounted) {
        ScaffoldMessenger.of(mainContext).showSnackBar(
          SnackBar(
            content: Text('Не удалось удалить фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Widget _buildVisitorPhotosSection(AirportModel airport) {
    print('📸 [AirportInfoBottomSheet] _buildVisitorPhotosSection: visitorPhotos = ${airport.visitorPhotos}');
    print('📸 [AirportInfoBottomSheet] visitorPhotos type: ${airport.visitorPhotos.runtimeType}');
    final hasPhotos = airport.visitorPhotos != null && airport.visitorPhotos!.isNotEmpty;
    print('📸 [AirportInfoBottomSheet] hasPhotos = $hasPhotos');
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Фото посетителей', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 4.h),
                Text(
                  'Фотографии, добавленные посетителями',
                  style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
                ),
              ],
            ),
            // Кнопка загрузки фотографий (показывается всегда, но проверяет авторизацию при нажатии)
            TextButton.icon(
              onPressed: () => _handleAddPhotosClick(context, airport),
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
          Column(
            children: airport.visitorPhotos!.asMap().entries.map((entry) {
              final index = entry.key;
              final photoUrl = entry.value;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      // Фотография
                      GestureDetector(
                        onTap: () => _showVisitorPhotoViewer(context, airport, airport.visitorPhotos!, index),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(photoUrl),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200.h,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            cacheKey: photoUrl,
                            placeholder: (context, url) => Container(
                              color: Color(0xFFF3F4F6),
                              height: 200.h,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Color(0xFFF3F4F6),
                              height: 200.h,
                              child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF)),
                            ),
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
                          onSelected: (value) async {
                            switch (value) {
                              case 'share':
                                _sharePhoto(context, photoUrl);
                                break;
                              case 'download':
                                _downloadPhoto(context, photoUrl);
                                break;
                              case 'delete':
                                // Проверяем авторство перед удалением
                                await _deleteVisitorPhoto(context, airport, photoUrl);
                                break;
                            }
                          },
                          itemBuilder: (context) {
                            final appState = Provider.of<AppState>(context, listen: false);
                            final isAuthenticated = appState.isAuthenticated;
                            
                            return [
                              PopupMenuItem(
                                value: 'share',
                                child: Row(
                                  children: [
                                    Icon(Icons.share, size: 20, color: Color(0xFF374151)),
                                    SizedBox(width: 12.w),
                                    Text('Поделиться', style: AppStyles.regular14s),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'download',
                                child: Row(
                                  children: [
                                    Icon(Icons.download, size: 20, color: Color(0xFF374151)),
                                    SizedBox(width: 12.w),
                                    Text('Скачать', style: AppStyles.regular14s),
                                  ],
                                ),
                              ),
                              // Кнопка удаления показывается только для авторизованных пользователей
                              // Проверка авторства будет на backend
                              if (isAuthenticated)
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                      SizedBox(width: 12.w),
                                      Text('Удалить', style: AppStyles.regular14s.copyWith(color: Colors.red)),
                                    ],
                                  ),
                                ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
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
                  'Пока нет фотографий посетителей',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Обработка нажатия на кнопку "Добавить фотографии"
  Future<void> _handleAddPhotosClick(BuildContext context, AirportModel airport) async {
    final appState = Provider.of<AppState>(context, listen: false);
    
    // Проверяем авторизацию
    if (!appState.isAuthenticated) {
      // Сохраняем информацию о том, что нужно открыть загрузку фотографий после авторизации
      PendingActions.setPendingPhotoUpload(airport.code);
      
      // Закрываем bottom sheet
      Navigator.of(context).pop();
      
      // Показываем экран авторизации
      await showCupertinoModalBottomSheet<bool>(
        barrierColor: Colors.black12,
        topRadius: const Radius.circular(20),
        context: context,
        builder: (context) => PhoneAuthScreen(),
      );
      
      // После закрытия экрана авторизации проверяем, авторизован ли пользователь
      // Если да, загрузка фотографий откроется автоматически через BlocListener
      return;
    }
    
    // Если авторизован, сразу показываем диалог загрузки
    _showUploadVisitorPhotosDialog(context, airport);
  }

  /// Диалог для загрузки фотографий посетителей
  void _showUploadVisitorPhotosDialog(BuildContext context, AirportModel airport) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage(
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (images == null || images.isEmpty) return;

    BuildContext? dialogContext;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        dialogContext = ctx;
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text('Загрузка фотографий...', style: AppStyles.regular14s),
            ],
          ),
        );
      },
    );

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final airportService = AirportService(dataSource.dio);
      
      final updatedAirport = await airportService.uploadVisitorPhotos(
        airportCode: airport.code,
        photos: images,
      );
      
      print('📸 [AirportInfoBottomSheet] После uploadVisitorPhotos: updatedAirport.visitorPhotos = ${updatedAirport.visitorPhotos}');

      // Закрываем диалог загрузки перед обработкой результата
      if (dialogContext != null && Navigator.of(dialogContext!).canPop()) {
        Navigator.of(dialogContext!).pop();
      } else if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }

      // Сохраняем ScaffoldMessenger до асинхронных операций
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      // Обновляем данные аэропорта
      await _loadAirport();
      
      print('📸 [AirportInfoBottomSheet] После _loadAirport: _airport?.visitorPhotos = ${_airport?.visitorPhotos}');

      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотографии успешно загружены'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Закрываем диалог загрузки в случае ошибки
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
      if (mounted) {
        // Сохраняем ScaffoldMessenger для блока catch
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Ошибка при загрузке фотографий: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          ),
        );
      }
    }
  }

  /// Просмотр фотографии посетителя в полноэкранном режиме (с проверкой авторства)
  void _showVisitorPhotoViewer(BuildContext mainContext, AirportModel airport, List<String> photos, int initialIndex) {
    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;
    final appState = Provider.of<AppState>(mainContext, listen: false);
    final isAuthenticated = appState.isAuthenticated;

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
                  itemCount: photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(photos[index]),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            cacheKey: photos[index],
                            placeholder: (context, url) => Container(
                              color: Colors.black,
                              child: Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16.h),
                                    Text(
                                      'Не удалось загрузить изображение',
                                      style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                '${currentIndex + 1} / ${photos.length}',
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
                                  onPressed: () => _sharePhoto(mainContext, photos[currentIndex]),
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
                                  onPressed: () => _downloadPhoto(mainContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
                                  tooltip: 'Скачать',
                                ),
                                // Кнопка "Удалить" (только для авторизованных пользователей)
                                // Проверка авторства будет на backend
                                if (isAuthenticated) ...[
                                  SizedBox(width: 8.w),
                                  IconButton(
                                    icon: Icon(Icons.delete_outline, color: Colors.red, size: 24),
                                    onPressed: () => _deleteVisitorPhotoFromViewer(
                                      mainContext,
                                      dialogContext,
                                      airport,
                                      photos[currentIndex],
                                      currentIndex,
                                      photos,
                                      setState,
                                      pageController,
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Удалить',
                                  ),
                                ],
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
                if (showControls && photos.length > 1)
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
                                  photos.length,
                                  (index) => Container(
                                    width: 6.w,
                                    height: 6.w,
                                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == currentIndex
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Кнопка "Вперед"
                            if (currentIndex < photos.length - 1)
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

  /// Удалить фотографию посетителя из списка
  Future<void> _deleteVisitorPhoto(BuildContext context, AirportModel airport, String photoUrl) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Сохраняем ScaffoldMessenger до асинхронных операций
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final airportService = AirportService(dataSource.dio);

      await airportService.deleteVisitorPhoto(
        airportCode: airport.code,
        photoUrl: photoUrl,
      );

      // Обновляем данные аэропорта
      await _loadAirport();

      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография успешно удалена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось удалить фотографию: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Удалить фотографию посетителя из просмотра
  Future<void> _deleteVisitorPhotoFromViewer(
    BuildContext mainContext,
    BuildContext dialogContext,
    AirportModel airport,
    String photoUrl,
    int currentIndex,
    List<String> photos,
    StateSetter setState,
    PageController pageController,
  ) async {
    final confirmed = await showDialog<bool>(
      context: mainContext,
      builder: (dialogBuilderContext) => AlertDialog(
        title: Text('Удалить фотографию?'),
        content: Text('Вы уверены, что хотите удалить эту фотографию? Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(false),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogBuilderContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    // Сохраняем ScaffoldMessenger до асинхронных операций
    final scaffoldMessenger = ScaffoldMessenger.of(mainContext);

    try {
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final airportService = AirportService(dataSource.dio);

      await airportService.deleteVisitorPhoto(
        airportCode: airport.code,
        photoUrl: photoUrl,
      );

      // Если это последняя фотография, закрываем просмотр
      if (photos.length == 1) {
        if (Navigator.of(dialogContext).canPop()) {
          Navigator.of(dialogContext).pop();
        }
      } else {
        // Переходим на предыдущую или следующую фотографию
        if (currentIndex > 0) {
          pageController.previousPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else if (currentIndex < photos.length - 1) {
          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }

      // Обновляем данные аэропорта
      await _loadAirport();

      if (mainContext.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Фотография успешно удалена'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mainContext.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось удалить фотографию: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}

/// Функция для показа bottom sheet с информацией об аэропорте
Future<void> showAirportInfoBottomSheet(BuildContext context, String airportCode) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => AirportInfoBottomSheet(airportCode: airportCode),
  );
}

