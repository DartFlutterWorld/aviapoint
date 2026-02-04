import 'dart:io';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_entity.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/airport_info_bottom_sheet.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final bottomMargin = AppSpacing.section;
        final horizontalPadding = AppSpacing.horizontal;
        final verticalPadding = 12.0;
        final borderRadius16 = 16.0;
        final borderRadius8 = 8.0;
        final spacing8 = 8.0;
        final spacing4 = 4.0;
        final iconSize = 24.0; // Единый размер для всех иконок (увеличен для лучшей видимости)
        final regular12s = AppStyles.regular12s;
        final regular14s = AppStyles.regular14s;
        final bold12s = AppStyles.bold12s;
        final padding22 = 22.0;
        final padding8 = AppSpacing.horizontal;
        final padding4 = 4.0;
        final photoSize = 80.0; // Фиксированный размер фото
        final avatarSize = 40.0; // Фиксированный размер аватара

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: bottomMargin),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius16),
              border: Border.all(color: Color(0xFFD9E6F8)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ID полета и дата вылета в одной строке
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tag, size: iconSize, color: Color(0xFF9CA5AF)),
                        SizedBox(width: spacing4),
                        Text('ID: ${flight.id}', style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: padding8, vertical: padding4),
                      decoration: BoxDecoration(color: Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(borderRadius8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today, size: iconSize, color: Color(0xFF374151)),
                          SizedBox(width: spacing4),
                          Text('Вылет ', style: regular14s.copyWith(color: Color(0xFF374151))),

                          Text(formatDateWithTime(flight.departureDate), style: regular14s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing8),
                // Статус
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: padding8, vertical: padding4),
                      decoration: BoxDecoration(
                        color: flight.status == 'active'
                            ? Color(0xFFD1FAE5)
                            : flight.status == 'completed'
                            ? Color(0xFFFFF4E6)
                            : Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(borderRadius8),
                      ),
                      child: Text(
                        flight.status == 'active'
                            ? 'Активен'
                            : flight.status == 'completed'
                            ? 'Завершен'
                            : 'Отменен',
                        style: regular12s.copyWith(
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
                SizedBox(height: spacing8),
                // Маршрут
                Column(
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
                              SizedBox(height: spacing8),
                              Padding(
                                padding: EdgeInsets.only(left: padding22),
                                child: Icon(Icons.arrow_downward, size: iconSize, color: isLast ? Color(0xFF0A6EFA) : Color(0xFF9CA5AF)),
                              ),
                              SizedBox(height: spacing8),
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
                SizedBox(height: AppSpacing.section + 8),
                // Компенсация и свободных мест в едином сером контейнере (как "Дополнительная информация о полёте")
                Container(
                  padding: EdgeInsets.all(padding8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius8),
                    color: Color(0xFFF9FAFB),
                    border: Border.all(color: Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Компенсация
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Компенсация', style: regular12s.copyWith(color: Color(0xFF374151))),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: padding8, vertical: padding4),
                            decoration: BoxDecoration(color: Color(0xFF10B981).withOpacity(0.1), borderRadius: BorderRadius.circular(borderRadius8)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.currency_ruble, size: iconSize, color: Color(0xFF0A6EFA)),
                                SizedBox(width: spacing4),
                                Text('${formatPrice(flight.pricePerSeat.toInt())} / место', style: regular12s.copyWith(color: Color(0xFF374151))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: spacing8),
                      // Свободных мест
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Свободных мест', style: regular12s.copyWith(color: Color(0xFF374151))),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: padding8, vertical: padding4),
                            decoration: BoxDecoration(color: Color(0xFF10B981).withOpacity(0.1), borderRadius: BorderRadius.circular(borderRadius8)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.event_seat, size: iconSize, color: Color(0xFF0A6EFA)),
                                SizedBox(width: spacing4),
                                Text('${flight.availableSeats}', style: regular12s.copyWith(color: Color(0xFF374151))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.section),

                // Информация о пилоте
                if (flight.pilotFullName != null || flight.pilotAverageRating != null) ...[
                  Container(
                    padding: EdgeInsets.all(padding8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius8),
                      color: Color(0xFFF9FAFB),
                      border: Border.all(color: Color(0xFFE5E7EB)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                      children: [
                        // Аватар пилота
                        Builder(
                          builder: (context) {
                            final avatarUrl = flight.pilotAvatarUrl;
                            final imageUrl = avatarUrl != null && avatarUrl.isNotEmpty ? getImageUrl(avatarUrl) : null;

                            return GestureDetector(
                              onTap: avatarUrl != null && avatarUrl.isNotEmpty ? () => _showPhotoViewer(context, [avatarUrl], 0) : null, // Если нет фото, не открываем просмотр
                              child: ClipOval(
                                child: imageUrl != null && imageUrl.isNotEmpty
                                    ? NetworkImageWidget(
                                        imageUrl: imageUrl,
                                        width: avatarSize,
                                        height: avatarSize,
                                        fit: BoxFit.cover,
                                        placeholder: Image.asset(Pictures.pilot, width: avatarSize, height: avatarSize, fit: BoxFit.cover),
                                        errorWidget: Image.asset(Pictures.pilot, width: avatarSize, height: avatarSize, fit: BoxFit.cover),
                                      )
                                    : Image.asset(Pictures.pilot, width: avatarSize, height: avatarSize, fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: padding8),
                        // Имя и рейтинг
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(flight.pilotFullName ?? 'Пилот', style: bold12s.copyWith(color: Color(0xFF374151))),
                              if (flight.pilotAverageRating != null && flight.pilotAverageRating! > 0) ...[
                                SizedBox(height: spacing4 / 2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                Row(
                                  children: [
                                    Icon(Icons.star, size: iconSize, color: Color(0xFFFFA726)),
                                    SizedBox(width: spacing4),
                                    Text(flight.pilotAverageRating!.toStringAsFixed(1), style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
                                  ],
                                        ),
                                        // Кнопка отзывов о пилоте
                                        TextButton(
                                          onPressed: () {
                                            openPilotReviews(context: context, pilotId: flight.pilotId);
                                          },
                                          child: Text('Отзывы', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                                        ),
                                      ],
                                    ),
                                  ] else ...[
                                    // Кнопка отзывов о пилоте (если нет рейтинга)
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          openPilotReviews(context: context, pilotId: flight.pilotId);
                                        },
                                        child: Text('Отзывы', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                                      ),
                                ),
                              ],
                            ],
                          ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.section),
                  // Комментарий под пилотом
                  if (flight.description != null && flight.description!.isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.all(padding8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius8),
                        color: Color(0xFFF9FAFB),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.comment_outlined, size: iconSize, color: Color(0xFF9CA5AF)),
                              SizedBox(width: spacing4),
                              Text('Доп информация о полёте', style: regular12s.copyWith(color: Color(0xFF374151))),
                            ],
                          ),
                          SizedBox(height: spacing4),
                          Text(flight.description!, style: regular12s.copyWith(color: Color(0xFF4B5767))),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSpacing.section),
                    // Модель самолёта и фотографии в едином сером контейнере (как секции выше)
                    if ((flight.aircraftType != null && flight.aircraftType!.isNotEmpty) || (flight.photos != null && flight.photos!.isNotEmpty)) ...[
                      Container(
                        padding: EdgeInsets.all(padding8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius8),
                          color: Color(0xFFF9FAFB),
                          border: Border.all(color: Color(0xFFE5E7EB)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Модель самолёта (если указана)
                            if (flight.aircraftType != null && flight.aircraftType!.isNotEmpty) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Text('Модель cамолёта', style: regular12s.copyWith(color: Color(0xFF374151))),
                                  ),

                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: padding8, vertical: 4),
                                      decoration: BoxDecoration(color: Color(0xFF10B981).withOpacity(0.1), borderRadius: BorderRadius.circular(borderRadius8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.flight, size: iconSize, color: Color(0xFF9CA5AF)),
                                          SizedBox(width: spacing4),
                                          Flexible(
                                            child: Text(flight.aircraftType!, style: regular12s.copyWith(color: Color(0xFF374151))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (flight.photos != null && flight.photos!.isNotEmpty) SizedBox(height: AppSpacing.section),
                            ],
                            // Фотографии самолёта (если есть)
                            if (flight.photos != null && flight.photos!.isNotEmpty) ...[
                              SizedBox(
                                height: photoSize,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: flight.photos!.length,
                                  itemBuilder: (context, index) {
                                    final photoUrl = flight.photos![index];
                                    return GestureDetector(
                                      onTap: () => _showPhotoViewer(context, flight.photos!, index),
                                      child: Container(
                                        width: photoSize,
                                        height: photoSize,
                                        margin: EdgeInsets.only(right: padding8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(borderRadius8),
                                          border: Border.all(color: Color(0xFFE5E7EB)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(borderRadius8),
                                          child: NetworkImageWidget(
                                            imageUrl: getImageUrl(photoUrl),
                                            fit: BoxFit.cover,
                                            placeholder: Container(
                                              color: Color(0xFFF3F4F6),
                                              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                            ),
                                            errorWidget: Container(
                                              color: Color(0xFFF3F4F6),
                                              child: Icon(Icons.broken_image, color: Color(0xFF9CA5AF), size: iconSize),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ],
                ],
              ],
            ),
          ),
        );
      },
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
    // Фиксированные размеры
    final padding8 = AppSpacing.horizontal;
    final borderRadius8 = 8.0;
    final borderRadius4 = 4.0;
    final iconSize = 24.0; // Единый размер для всех иконок (увеличен для лучшей видимости)
    final spacing8 = AppSpacing.horizontal;
    final spacing4 = 4.0;
    final spacing6 = 6.0;
    final spacing2 = 2.0;
    final spacing2v = 2.0;
    final bold16s = AppStyles.bold16s;
    final regular12s = AppStyles.regular12s;
    final medium10s = AppStyles.medium10s;

    // Используем переданную иконку и определяем цвет в зависимости от неё (как в деталке)
    IconData iconData = icon;
    Color iconColor;

    if (icon == Icons.flight_takeoff) {
      // Зелёный для отправления
      iconColor = Colors.green;
    } else if (icon == Icons.flight_land) {
      // Красный для прибытия
      iconColor = Colors.red;
    } else if (icon == Icons.flight) {
      // Синий для промежуточных точек
      iconColor = Colors.blue;
    } else {
      // По умолчанию синий
      iconColor = Color(0xFF0A6EFA);
    }

    // Получаем отображаемый тип
    String typeDisplay = '';
    if (type != null && type.isNotEmpty) {
      final typeLower = type.toLowerCase().trim();
      switch (typeLower) {
        case 'heliport':
        case 'вертодром':
          typeDisplay = 'Вертодром';
          break;
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
    }

    return GestureDetector(
      onTap: () {
        showAirportInfoBottomSheet(context, code);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(padding8),
            decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(borderRadius8)),
            child: Icon(iconData, color: iconColor, size: iconSize),
          ),
          SizedBox(width: spacing8),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Код и русский код
                Row(
                  children: [
                    Flexible(
                      child: Text(code, style: bold16s.copyWith(color: Color(0xFF0A6EFA))),
                    ),
                    if (identRu != null && identRu != code) ...[
                      SizedBox(width: spacing4),
                      Flexible(
                        child: Text('($identRu)', style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
                      ),
                    ],
                    if (isInternational) ...[
                      SizedBox(width: spacing6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: spacing4, vertical: spacing2v),
                        decoration: BoxDecoration(color: Color(0xFF0A6EFA).withOpacity(0.1), borderRadius: BorderRadius.circular(borderRadius4)),
                        child: Text(
                          'INT',
                          style: medium10s.copyWith(color: Color(0xFF0A6EFA), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ],
                ),
                // Название аэропорта
                if (name != null) ...[
                  SizedBox(height: spacing2v),
                  Flexible(
                    child: Text(name, style: regular12s.copyWith(color: Color(0xFF374151))),
                  ),
                ],
                // Город, регион, тип
                if (city != null || region != null || typeDisplay.isNotEmpty) ...[
                  SizedBox(height: spacing2v),
                  Flexible(
                    child: Wrap(
                      spacing: spacing6,
                      runSpacing: spacing4,
                      children: [
                        if (city != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_city, size: iconSize, color: Color(0xFF9CA5AF)),
                              SizedBox(width: spacing2),
                              Flexible(
                                child: Text(city, style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ),
                            ],
                          ),
                        if (region != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (city != null) ...[Text('•', style: regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: spacing6)],
                              Flexible(
                                child: Text(region, style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
                              ),
                            ],
                          ),
                        if (typeDisplay.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (city != null || region != null) ...[Text('•', style: regular12s.copyWith(color: Color(0xFF9CA5AF))), SizedBox(width: spacing6)],
                              Flexible(
                                child: Text(typeDisplay, style: regular12s.copyWith(color: Color(0xFF9CA5AF))),
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
    // Преобразуем относительные пути в полные URL
    final fullUrls = photos.map((photo) => getImageUrl(photo)).toList();
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
                  itemCount: fullUrls.length,
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
                          child: NetworkImageWidget(
                            imageUrl: fullUrls[index],
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: Container(
                              color: Colors.black,
                              child: Center(child: CircularProgressIndicator(color: Colors.white)),
                            ),
                            errorWidget: Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64),
                                    SizedBox(height: 16),
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
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Индикатор текущей фотографии
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '${currentIndex + 1} / ${fullUrls.length}',
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
                                SizedBox(width: 8),
                                // Кнопка "Скачать"
                                IconButton(
                                  icon: Icon(Icons.download, color: Colors.white, size: 24),
                                  onPressed: () => _downloadPhoto(dialogContext, photos[currentIndex]),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                  tooltip: 'Скачать',
                                ),
                                SizedBox(width: 8),
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
                if (showControls && fullUrls.length > 1)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                              SizedBox(width: 48),

                            // Индикатор точек
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  fullUrls.length,
                                  (index) => Container(
                                    width: 6,
                                    height: 6,
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: index == currentIndex ? Colors.white : Colors.white.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                            ),

                            // Кнопка "Вперед"
                            if (currentIndex < fullUrls.length - 1)
                              IconButton(
                                icon: Icon(Icons.chevron_right, color: Colors.white, size: 32),
                                onPressed: () {
                                  pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                                },
                                style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                              )
                            else
                              SizedBox(width: 48),
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
      // Извлекаем имя файла из URL (может быть полным или относительным)
      final uri = Uri.tryParse(imageUrl);
      final fileName = uri != null ? uri.pathSegments.last : imageUrl.split('/').last;
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
