import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingCard extends StatelessWidget {
  final BookingEntity booking;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  const BookingCard({super.key, required this.booking, this.onTap, this.onCancel});

  @override
  Widget build(BuildContext context) {
    String statusText;
    Color statusColor;
    Color statusBgColor;

    switch (booking.status) {
      case 'pending':
        statusText = 'Ожидает подтверждения';
        statusColor = Color(0xFFFFA726);
        statusBgColor = Color(0xFFFFF4E6);
        break;
      case 'confirmed':
        statusText = 'Подтверждено';
        statusColor = Color(0xFF10B981);
        statusBgColor = Color(0xFFD1FAE5);
        break;
      case 'cancelled':
        statusText = 'Отменено';
        statusColor = Color(0xFFEF4444);
        statusBgColor = Color(0xFFFEE2E2);
        break;
      default:
        statusText = booking.status;
        statusColor = Color(0xFF9CA5AF);
        statusBgColor = Color(0xFFF3F4F6);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFD9E6F8)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок и статус
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('Бронирование #${booking.id}', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: statusBgColor, borderRadius: BorderRadius.circular(8)),
                  child: Text(statusText, style: AppStyles.regular12s.copyWith(color: statusColor)),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Маршрут и дата вылета
            if (booking.flightWaypoints != null && booking.flightWaypoints!.isNotEmpty) ...[
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF0F9FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF0A6EFA).withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Маршрут со всеми точками
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...booking.flightWaypoints!.asMap().entries.expand((entry) {
                          final index = entry.key;
                          final airportCode = entry.value;
                          final isFirst = index == 0;
                          final isLast = index == booking.flightWaypoints!.length - 1;

                          return [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(isFirst ? Icons.flight_takeoff : (isLast ? Icons.flight_land : Icons.flight), size: 18, color: Color(0xFF0A6EFA)),
                                SizedBox(width: 6),
                                Text(airportCode, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                              ],
                            ),
                            if (!isLast) ...[SizedBox(width: 4), Icon(Icons.arrow_forward, size: 16, color: Color(0xFF0A6EFA)), SizedBox(width: 4)],
                          ];
                        }).toList(),
                      ],
                    ),
                    // Дата вылета
                    if (booking.flightDepartureDate != null) ...[
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Color(0xFF9CA5AF)),
                          SizedBox(width: 6),
                          Text(formatDate(booking.flightDepartureDate!), style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 16),
            ] else if (booking.flightDepartureAirport != null || booking.flightArrivalAirport != null) ...[
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF0F9FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF0A6EFA).withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Маршрут (fallback если waypoints нет)
                    if (booking.flightDepartureAirport != null && booking.flightArrivalAirport != null) ...[
                      Row(
                        children: [
                          Icon(Icons.flight_takeoff, size: 18, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 8),
                          Text(booking.flightDepartureAirport!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward, size: 18, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 12),
                          Icon(Icons.flight_land, size: 18, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 8),
                          Text(booking.flightArrivalAirport!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ] else if (booking.flightDepartureAirport != null) ...[
                      Row(
                        children: [
                          Icon(Icons.flight_takeoff, size: 18, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 8),
                          Text(booking.flightDepartureAirport!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ] else if (booking.flightArrivalAirport != null) ...[
                      Row(
                        children: [
                          Icon(Icons.flight_land, size: 18, color: Color(0xFF0A6EFA)),
                          SizedBox(width: 8),
                          Text(booking.flightArrivalAirport!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ],
                    // Дата вылета
                    if (booking.flightDepartureDate != null) ...[
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Color(0xFF9CA5AF)),
                          SizedBox(width: 6),
                          Text(formatDate(booking.flightDepartureDate!), style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
            // Информация о бронировании
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.event_seat, size: 16, color: Color(0xFF9CA5AF)),
                      SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          '${booking.seatsCount} ${booking.seatsCount == 1
                              ? 'место'
                              : booking.seatsCount < 5
                              ? 'места'
                              : 'мест'}',
                          style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 16, color: Color(0xFF10B981)),
                    SizedBox(width: 6),
                    Text('${formatPrice(booking.totalPrice.toInt())}', style: AppStyles.bold14s.copyWith(color: Color(0xFF10B981))),
                  ],
                ),
              ],
            ),
            // Контакты пилота (только для подтвержденных бронирований)
            if (booking.status == 'confirmed' && (booking.pilotPhone != null || booking.pilotEmail != null || booking.pilotTelegram != null || booking.pilotMax != null)) ...[
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFF0F9FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF0A6EFA).withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: 18, color: Color(0xFF0A6EFA)),
                        SizedBox(width: 8),
                        Text('Контакты пилота', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
                      ],
                    ),
                    if (booking.pilotFullName != null) ...[
                      SizedBox(height: 8),
                      Text(booking.pilotFullName!, style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                    ],
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        if (booking.pilotPhone != null && booking.pilotPhone!.isNotEmpty)
                          _buildContactButton(
                            context: context,
                            icon: Icons.phone,
                            label: formatPhone(booking.pilotPhone!),
                            color: Color(0xFF10B981),
                            onTap: () => _launchPhone(context, booking.pilotPhone!),
                          ),
                        if (booking.pilotEmail != null && booking.pilotEmail!.isNotEmpty)
                          _buildContactButton(
                            context: context,
                            icon: Icons.email,
                            label: booking.pilotEmail!,
                            color: Color(0xFF0A6EFA),
                            onTap: () => _launchEmail(context, booking.pilotEmail!),
                          ),
                        if (booking.pilotTelegram != null && booking.pilotTelegram!.isNotEmpty)
                          _buildContactButton(
                            context: context,
                            icon: Icons.send,
                            label: booking.pilotTelegram!,
                            color: Color(0xFF0088CC),
                            onTap: () => _launchTelegram(context, booking.pilotTelegram!),
                          ),
                        if (booking.pilotMax != null && booking.pilotMax!.isNotEmpty)
                          _buildContactButton(
                            context: context,
                            icon: Icons.message,
                            label: booking.pilotMax!,
                            color: Color(0xFF9CA5AF),
                            onTap: () => _launchMax(context, booking.pilotMax!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            // Кнопка отмены (если статус pending или confirmed)
            if ((booking.status == 'pending' || booking.status == 'confirmed') && onCancel != null) ...[
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFEF4444)),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text('Отменить бронирование', style: AppStyles.bold14s.copyWith(color: Color(0xFFEF4444))),
                ),
              ),
            ],
            // Кнопка перехода к деталям полета
            if (onTap != null) ...[
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onTap,
                  style: TextButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 12)),
                  child: Text('Подробнее о полете', style: AppStyles.bold14s.copyWith(color: Color(0xFF0A6EFA))),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppStyles.regular12s.copyWith(color: color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть почтовый клиент'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchTelegram(BuildContext context, String telegram) async {
    final username = telegram.replaceAll('@', '');
    final uri = Uri.parse('https://t.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)),
        );
      }
    }
  }

  Future<void> _launchMax(BuildContext context, String max) async {
    final username = max.replaceAll('@', '');
    final uri = Uri.parse('https://max.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)),
        );
      }
    }
  }
}
