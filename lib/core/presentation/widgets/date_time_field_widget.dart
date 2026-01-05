import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// Переиспользуемый виджет для выбора даты и времени
class DateTimeFieldWidget extends StatelessWidget {
  final String? label;
  final DateTime? initialDateTime;
  final void Function(DateTime?) onDateTimeSelected;
  final Key? fieldKey;

  const DateTimeFieldWidget({
    Key? key,
    this.label,
    this.initialDateTime,
    required this.onDateTimeSelected,
    this.fieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: fieldKey,
      onTap: () => _showDateTimePicker(context),
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
                initialDateTime != null ? DateFormat('dd.MM.yyyy HH:mm').format(initialDateTime!) : 'Выберите дату и время',
                style: AppStyles.regular14s.copyWith(color: initialDateTime != null ? Color(0xFF374151) : Color(0xFF9CA5AF)),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF9CA5AF)),
          ],
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
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
      value: initialDateTime != null ? [initialDateTime!] : [],
    );

    if (dateResult == null || dateResult.isEmpty) return;

    final selectedDate = dateResult.first;
    if (selectedDate == null) return;

    // Затем выбираем время
    final timeResult = await showTimePicker(
      context: context,
      initialTime: initialDateTime != null ? TimeOfDay.fromDateTime(initialDateTime!) : TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(primary: Color(0xFF0A6EFA))),
          child: child!,
        );
      },
    );

    if (timeResult != null) {
      final dateTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, timeResult.hour, timeResult.minute);
      onDateTimeSelected(dateTime);
    }
  }
}

