import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';

class FilterBottomSheet extends StatefulWidget {
  final DateTime? initialDateFrom;
  final DateTime? initialDateTo;
  final void Function(DateTime?, DateTime?) onApply;

  const FilterBottomSheet({super.key, this.initialDateFrom, this.initialDateTo, required this.onApply});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  DateTime? _dateFrom;
  DateTime? _dateTo;

  @override
  void initState() {
    super.initState();
    _dateFrom = widget.initialDateFrom;
    _dateTo = widget.initialDateTo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Заголовок
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Фильтры', style: AppStyles.bold20s.copyWith(color: const Color(0xFF374151))),
              IconButton(icon: SvgPicture.asset(Pictures.closeAuth), onPressed: () => Navigator.pop(context)),
            ],
          ),
          SizedBox(height: 16),
          // Информация о выбранном диапазоне
          if (_dateFrom != null || _dateTo != null)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Color(0xFF0A6EFA)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _dateFrom != null && _dateTo != null
                          ? '${formatDate(_dateFrom!)} - ${formatDate(_dateTo!)}'
                          : _dateFrom != null
                          ? 'От: ${formatDate(_dateFrom!)}'
                          : 'До: ${formatDate(_dateTo!)}',
                      style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    ),
                  ),
                  if (_dateFrom != null || _dateTo != null)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _dateFrom = null;
                          _dateTo = null;
                        });
                      },
                      child: SvgPicture.asset(Pictures.closeAuth, width: 18, height: 18, colorFilter: const ColorFilter.mode(Color(0xFF9CA5AF), BlendMode.srcIn)),
                    ),
                ],
              ),
            ),
          if (_dateFrom != null || _dateTo != null) SizedBox(height: 16),
          // Календарь
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              selectedDayHighlightColor: Color(0xFF0A6EFA),
              todayTextStyle: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA)),
              selectedDayTextStyle: AppStyles.bold14s.copyWith(color: Colors.white),
              firstDayOfWeek: 1, // Понедельник
              weekdayLabelTextStyle: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)),
              controlsHeight: 50,
              dayTextStyle: AppStyles.regular14s,
            ),
            value: [if (_dateFrom != null) _dateFrom!, if (_dateTo != null && _dateTo != _dateFrom) _dateTo!],
            onValueChanged: (dates) {
              setState(() {
                if (dates.isNotEmpty) {
                  // Устанавливаем время на начало дня для dateFrom
                  final firstDate = dates.first;
                  _dateFrom = DateTime(firstDate.year, firstDate.month, firstDate.day, 0, 0, 0);
                  if (dates.length > 1) {
                    // Устанавливаем время на конец дня для dateTo
                    final lastDate = dates.last;
                    _dateTo = DateTime(lastDate.year, lastDate.month, lastDate.day, 23, 59, 59);
                  } else {
                    // Если выбрана только одна дата, очищаем dateTo (пользователь может выбрать вторую дату)
                    _dateTo = null;
                  }
                } else {
                  _dateFrom = null;
                  _dateTo = null;
                }
              });
            },
          ),
          SizedBox(height: 16),
          // Кнопки
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _dateFrom = null;
                      _dateTo = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Color(0xFFD9E6F8)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Сбросить', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Если выбрана только одна дата, применяем её как диапазон от начала до конца дня
                    DateTime? dateFrom = _dateFrom;
                    DateTime? dateTo = _dateTo;

                    if (dateFrom != null && dateTo == null) {
                      // Если выбрана только начальная дата, устанавливаем её как диапазон на один день
                      dateTo = DateTime(dateFrom.year, dateFrom.month, dateFrom.day, 23, 59, 59);
                    } else if (dateFrom != null && dateTo != null) {
                      // Убеждаемся, что dateTo - это конец дня
                      dateTo = DateTime(dateTo.year, dateTo.month, dateTo.day, 23, 59, 59);
                    }

                    widget.onApply(dateFrom, dateTo);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A6EFA),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Применить', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
