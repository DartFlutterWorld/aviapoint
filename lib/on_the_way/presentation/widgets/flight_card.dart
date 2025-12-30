import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class FlightCard extends StatelessWidget {
  final FlightEntity flight;
  final VoidCallback? onTap;

  const FlightCard({super.key, required this.flight, this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final priceFormat = NumberFormat.currency(locale: 'ru_RU', symbol: '₽', decimalDigits: 0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xFFD9E6F8)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ID полета
            Row(
              children: [
                Icon(Icons.tag, size: 14, color: Color(0xFF9CA5AF)),
                SizedBox(width: 4.w),
                Text('ID: ${flight.id}', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
              ],
            ),
            SizedBox(height: 8.h),
            // Маршрут
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Отображаем маршрут из waypoints, если они есть
                      // ВСЕ точки маршрута (включая первую и последнюю) теперь в waypoints
                      if (flight.waypoints != null && flight.waypoints!.isNotEmpty) ...[
                        ...flight.waypoints!.asMap().entries.map((entry) {
                          final index = entry.key;
                          final waypoint = entry.value;
                          final isFirst = index == 0;
                          final isLast = index == flight.waypoints!.length - 1;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (index > 0) ...[
                                SizedBox(height: 8.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 22.w),
                                  child: Icon(Icons.arrow_downward, size: 16, color: isLast ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF)),
                                ),
                                SizedBox(height: 8.h),
                              ],
                              _buildAirportInfo(
                                context: context,
                                icon: isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight),
                                code: waypoint.airportCode,
                                identRu: waypoint.airportIdentRu,
                                name: waypoint.airportName,
                                city: waypoint.airportCity,
                                region: waypoint.airportRegion,
                                type: waypoint.airportType,
                                isInternational: false,
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: flight.status == 'active'
                        ? Color(0xFFD1FAE5)
                        : flight.status == 'completed'
                        ? Color(0xFFFFF4E6)
                        : Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    flight.status == 'active'
                        ? 'Активен'
                        : flight.status == 'completed'
                        ? 'Завершен'
                        : 'Отменен',
                    style: AppStyles.regular12s.copyWith(
                      color: flight.status == 'active'
                          ? Color(0xFF10B981)
                          : flight.status == 'completed'
                          ? Color(0xFFFFA726)
                          : Color(0xFFEF4444),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Дата и время
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Color(0xFF9CA5AF)),
                SizedBox(width: 6.w),
                Flexible(
                  child: Text(dateFormat.format(flight.departureDate), style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Цена и места
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text('${priceFormat.format(flight.pricePerSeat)} / место', style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981))),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Row(
                  children: [
                    Icon(Icons.event_seat, size: 16, color: Color(0xFF9CA5AF)),
                    SizedBox(width: 6.w),
                    Text('${flight.availableSeats} мест', style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF))),
                  ],
                ),
              ],
            ),
            // Тип самолета (если указан)
            if (flight.aircraftType != null && flight.aircraftType!.isNotEmpty) ...[
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.flight, size: 16, color: Color(0xFF9CA5AF)),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(flight.aircraftType!, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                  ),
                ],
              ),
            ],
            // Фотографии самолета (если есть)
            if (flight.photos != null && flight.photos!.isNotEmpty) ...[
              SizedBox(height: 8.h),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: flight.photos!.length,
                  itemBuilder: (context, index) {
                    final photoUrl = flight.photos![index];
                    return GestureDetector(
                      onTap: () => _showPhotoViewer(context, flight.photos!, index),
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(photoUrl),
                            fit: BoxFit.cover,
                            cacheManager: GetIt.instance<DefaultCacheManager>(),
                            cacheKey: photoUrl,
                            placeholder: (context, url) => Container(
                              color: Color(0xFFF3F4F6),
                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Color(0xFFF3F4F6),
                              child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF), size: 20),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            // Описание (если есть)
            if (flight.description != null && flight.description!.isNotEmpty) ...[
              SizedBox(height: 8.h),
              Text(
                flight.description!,
                style: AppStyles.regular12s.copyWith(color: Color(0xFF4B5767)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            // Информация о пилоте
            if (flight.pilotFullName != null || flight.pilotAverageRating != null) ...[
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Color(0xFFF9FAFB)),
                child: Row(
                  children: [
                    // Аватар пилота
                    Builder(
                      builder: (context) {
                        final avatarUrl = flight.pilotAvatarUrl;
                        final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

                        return GestureDetector(
                          onTap: imageUrl != null && imageUrl.isNotEmpty ? () => _showPhotoViewer(context, [imageUrl], 0) : null,
                          child: ClipOval(
                            child: imageUrl != null && imageUrl.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    width: 32.r,
                                    height: 32.r,
                                    fit: BoxFit.cover,
                                    cacheManager: GetIt.instance<DefaultCacheManager>(),
                                    cacheKey: avatarUrl,
                                    placeholder: (context, url) => Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover),
                                    errorWidget: (context, url, error) {
                                      print('❌ [FlightCard] Ошибка загрузки аватара пилота: error=$error, url=$url, avatarUrl=$avatarUrl');
                                      return Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover);
                                    },
                                  )
                                : Image.asset(Pictures.pilot, width: 32.r, height: 32.r, fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                    // Имя и рейтинг
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(flight.pilotFullName ?? 'Пилот', style: AppStyles.bold12s.copyWith(color: Color(0xFF374151))),
                          if (flight.pilotAverageRating != null && flight.pilotAverageRating! > 0) ...[
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Icon(Icons.star, size: 12, color: Color(0xFFFFA726)),
                                SizedBox(width: 4.w),
                                Text(flight.pilotAverageRating!.toStringAsFixed(1), style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Вспомогательный метод для отображения информации об аэропорте
  Widget _buildAirportInfo({
    required BuildContext context,
    required IconData icon,
    required String code,
    String? identRu,
    String? name,
    String? city,
    String? region,
    String? type,
    bool isInternational = false,
  }) {
    // Определяем иконку и цвет в зависимости от типа
    IconData iconData = Icons.local_airport; // Иконка аэропорта (самолётик) по умолчанию
    Color iconColor = Color(0xFF0A6EFA);

    // Получаем отображаемый тип и определяем иконку
    String typeDisplay = '';
    if (type != null && type.isNotEmpty) {
      final typeLower = type.toLowerCase().trim();
      print('🔍 [FlightCard] Тип аэропорта: "$type" -> "$typeLower"');

      // Проверяем сначала на вертодромы
      if (typeLower == 'heliport' || typeLower == 'вертодром' || typeLower.contains('heliport') || typeLower.contains('вертодром')) {
        iconData = Icons.airplanemode_active; // Иконка вертолёта (альтернативная иконка самолёта для визуального отличия)
        iconColor = Color(0xFF10B981);
        typeDisplay = 'Вертодром';
        print('✅ [FlightCard] Установлена иконка вертолёта для типа: $type');
      } else {
        // Для всех остальных типов - аэродром (самолётик)
        iconData = Icons.local_airport; // Иконка аэропорта (самолётик)
        iconColor = Color(0xFF0A6EFA);

        // Определяем отображаемый тип
        switch (typeLower) {
          case 'airport':
          case 'аэродром':
            typeDisplay = 'Аэродром';
            break;
          case 'small_airport':
            typeDisplay = 'Малый аэродром';
            break;
          case 'medium_airport':
            typeDisplay = 'Средний аэродром';
            break;
          case 'large_airport':
            typeDisplay = 'Крупный аэродром';
            break;
          default:
            typeDisplay = type;
        }
        print('✅ [FlightCard] Установлена иконка самолёта для типа: $type');
      }
    } else {
      print('⚠️ [FlightCard] Тип аэропорта не указан или пустой');
    }

    return GestureDetector(
      onTap: () {
        showAirportInfoBottomSheet(context, code);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8.r)),
            child: Icon(iconData, color: iconColor, size: 16.r),
          ),
          SizedBox(width: 8.w),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Код и русский код
                Row(
                  children: [
                    Flexible(
                      child: Text(code, style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                    ),
                    if (identRu != null && identRu != code) ...[
                      SizedBox(width: 4.w),
                      Flexible(
                        child: Text('($identRu)', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ),
                    ],
                    if (isInternational) ...[
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        decoration: BoxDecoration(color: Color(0xFF0A6EFA).withOpacity(0.1), borderRadius: BorderRadius.circular(4.r)),
                        child: Text(
                          'INT',
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ],
                ),
                // Название аэропорта
                if (name != null) ...[
                  SizedBox(height: 2.h),
                  Flexible(
                    child: Text(name, style: AppStyles.regular12s.copyWith(color: Color(0xFF374151))),
                  ),
                ],
                // Город, регион, тип
                if (city != null || region != null || typeDisplay.isNotEmpty) ...[
                  SizedBox(height: 2.h),
                  Flexible(
                    child: Wrap(
                      spacing: 6.w,
                      runSpacing: 4.h,
                      children: [
                        if (city != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_city, size: 10.r, color: Color(0xFF9CA5AF)),
                              SizedBox(width: 2.w),
                              Flexible(
                                child: Text(city, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ),
                            ],
                          ),
                        if (region != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (city != null) ...[Text('•', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: 6.w)],
                              Flexible(
                                child: Text(region, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ),
                            ],
                          ),
                        if (typeDisplay.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (city != null || region != null) ...[Text('•', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: 6.w)],
                              Flexible(
                                child: Text(typeDisplay, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Просмотр фотографии в полноэкранном режиме
  void _showPhotoViewer(BuildContext context, List<String> photos, int initialIndex) {
    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;

    showDialog<void>(
      context: context,
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
                              child: Center(child: CircularProgressIndicator(color: Colors.white)),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16.h),
                                    Text('Не удалось загрузить изображение', style: AppStyles.regular14s.copyWith(color: Colors.white70)),
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
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Индикатор текущей фотографии
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(20.r)),
                              child: Text(
                                '${currentIndex + 1} / ${photos.length}',
                                style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            ),
                            // Кнопки действий
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопка "Поделиться"
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.white, size: 24),
                                  onPressed: () => _sharePhoto(dialogContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Поделиться',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8.w),
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
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
                          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Кнопка "Назад"
                            if (currentIndex > 0)
                              IconButton(
                                icon: Icon(Icons.chevron_left, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                                },
                                style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
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
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: index == currentIndex ? Colors.white : Colors.white.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                            ),

                            // Кнопка "Вперед"
                            if (currentIndex < photos.length - 1)
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                                },
                                style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
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
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось поделиться фотографией'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Запрашиваем разрешение на запись (для Android)
      if (await Permission.storage.request().isGranted) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final savedFile = await File(filePath).copy('${appDocDir.path}/$fileName');

        if (context.mounted) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('Фотография сохранена: ${savedFile.path}'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
        }
      } else {
        if (context.mounted) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('Необходимо разрешение на сохранение файлов'), backgroundColor: Colors.orange, duration: Duration(seconds: 2)));
        }
      }
    } catch (e) {
      if (context.mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось скачать фотографию: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }
}
