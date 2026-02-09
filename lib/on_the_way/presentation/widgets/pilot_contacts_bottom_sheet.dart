import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/spacing.dart';
import 'package:aviapoint/on_the_way/domain/entities/booking_entity.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Bottom sheet для отображения контактов пилота после подтверждения бронирования
void showPilotContactsBottomSheet({required BuildContext context, required BookingEntity booking}) {
  showUniversalBottomSheet<void>(
    context: context,
    title: 'Контакты пилота',
    backgroundColor: Colors.white,
    showCloseButton: true,
    useRootNavigator: true,
    isDismissible: true,
    enableDrag: true,
    child: _PilotContactsContent(booking: booking),
  );
}

class _PilotContactsContent extends StatelessWidget {
  final BookingEntity booking;

  const _PilotContactsContent({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Информация о бронировании
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
                Text('Бронирование подтверждено!', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                SizedBox(height: 8),
                Text(
                  'Теперь вы можете связаться с пилотом для уточнения деталей полета',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          // Имя пилота
          if (booking.pilotFullName != null) ...[
            Row(
              children: [
                Icon(Icons.person, size: 20, color: Color(0xFF0A6EFA)),
                SizedBox(width: 8),
                Text(booking.pilotFullName!, style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
              ],
            ),
            SizedBox(height: 24),
          ],
          // Контакты
          Text('Способы связи:', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
          SizedBox(height: 16),
          // Телефон
          if (booking.pilotPhone != null && booking.pilotPhone!.isNotEmpty)
            _buildContactRow(
              context: context,
              icon: Icons.phone,
              label: 'Телефон',
              value: formatPhone(booking.pilotPhone!),
              color: Color(0xFF10B981),
              onTap: () => _launchPhone(context, booking.pilotPhone!),
            ),
          // Email
          if (booking.pilotEmail != null && booking.pilotEmail!.isNotEmpty) ...[
            if (booking.pilotPhone != null && booking.pilotPhone!.isNotEmpty) SizedBox(height: 12),
            _buildContactRow(
              context: context,
              icon: Icons.email,
              label: 'Email',
              value: booking.pilotEmail!,
              color: Color(0xFF0A6EFA),
              onTap: () => _launchEmail(context, booking.pilotEmail!),
            ),
          ],
          // Telegram
          if (booking.pilotTelegram != null && booking.pilotTelegram!.isNotEmpty) ...[
            if ((booking.pilotPhone != null && booking.pilotPhone!.isNotEmpty) ||
                (booking.pilotEmail != null && booking.pilotEmail!.isNotEmpty))
              SizedBox(height: 12),
            _buildContactRow(
              context: context,
              icon: Icons.send,
              label: 'Telegram',
              value: booking.pilotTelegram!,
              color: Color(0xFF0088CC),
              onTap: () => _launchTelegram(context, booking.pilotTelegram!),
            ),
          ],
          // MAX
          if (booking.pilotMax != null && booking.pilotMax!.isNotEmpty) ...[
            if ((booking.pilotPhone != null && booking.pilotPhone!.isNotEmpty) ||
                (booking.pilotEmail != null && booking.pilotEmail!.isNotEmpty) ||
                (booking.pilotTelegram != null && booking.pilotTelegram!.isNotEmpty))
              SizedBox(height: 12),
            _buildContactRow(
              context: context,
              icon: Icons.message,
              label: 'MAX',
              value: booking.pilotMax!,
              color: Color(0xFF9CA5AF),
              onTap: () => _launchMax(context, booking.pilotMax!),
            ),
          ],
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, size: 24, color: color),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                  SizedBox(height: 4),
                  Text(value, style: AppStyles.bold14s.copyWith(color: color)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: color),
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)));
      }
    }
  }

  Future<void> _launchEmail(BuildContext context, String email) async {
    final uri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось открыть почтовый клиент'), duration: Duration(seconds: 2)));
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)));
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)));
      }
    }
  }
}
