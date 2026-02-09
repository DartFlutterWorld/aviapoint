import 'dart:convert';

import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

String bigFirstSymbol(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

void logOut(BuildContext context) async {
  final apiDatasource = getIt.get<ApiDatasource>();
  apiDatasource.delAuthHeader();

  BlocProvider.of<AuthBloc>(context).add(InitialAuthEvent());
  BlocProvider.of<ProfileBloc>(context).add(InitialProfileEvent());
  await TokenStorage.clearTokens();
  Provider.of<AppState>(context, listen: false).checkAuthStatus();
}

(Color, Color) getColors(int id) {
  switch (id) {
    case 1:
      return (Color(0xFFD8F9EC), Color(0xFF15D585));
    case 2:
      return (Color(0xFFE8E8E8), Color(0xFF9A9A9A));
    case 3:
      return (Color(0xFFF7EBD3), Color(0xFFF49B3D));
    case 4:
      return (Color(0xFFFFE0E0), Color(0xFFFF6B6B));
    case 5:
      return (Color(0xFFE8DAFF), Color(0xFF8258F5));
    default:
      return (Colors.lime, Colors.black);
  }
}

final emptyQuestion = QuestionWithAnswersEntity(
  answers: List.empty(),
  questionId: 0,
  questionText: '',
  categoryTitle: '',
  categoryId: 0,
);

enum TestMode { training, standart }

enum Screens {
  learning, // обучение
  selectTopicsScreen, // Выбор сертификата и тем в боттом шите тестирования
}

class IntListJson extends TypeConverter<Set<int>, String> {
  const IntListJson();
  @override
  Set<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const {};
    final raw = jsonDecode(fromDb);
    return (raw as List).map((e) => (e as num).toInt()).toSet();
  }

  @override
  String toSql(Set<int> value) => jsonEncode(value.toList());
}

/// Форматирует номер телефона в формат +7 (###) ###-##-##
String formatPhone(String phone) {
  if (phone.isEmpty) return phone;

  // Удаляем все нецифровые символы, кроме плюса в начале
  String digits = phone.replaceAll(RegExp(r'[^\d+]'), '');

  // Если номер начинается с 8, заменяем на +7
  if (digits.startsWith('8')) {
    digits = '+7' + digits.substring(1);
  } else if (!digits.startsWith('+7') && !digits.startsWith('7')) {
    // Если нет кода страны, добавляем +7
    digits = '+7' + digits;
  } else if (digits.startsWith('7')) {
    digits = '+7' + digits.substring(1);
  }

  // Удаляем плюс для форматирования
  String cleanDigits = digits.replaceAll('+', '');

  // Если номер не содержит код страны 7, добавляем
  if (!cleanDigits.startsWith('7')) {
    cleanDigits = '7' + cleanDigits;
  }

  // Удаляем первую 7 для форматирования
  if (cleanDigits.startsWith('7') && cleanDigits.length > 1) {
    cleanDigits = cleanDigits.substring(1);
  }

  // Форматируем в (###) ###-##-##
  if (cleanDigits.length >= 10) {
    final area = cleanDigits.substring(0, 3);
    final first = cleanDigits.substring(3, 6);
    final second = cleanDigits.substring(6, 8);
    final third = cleanDigits.substring(8, cleanDigits.length > 10 ? 10 : cleanDigits.length);
    return '+7 ($area) $first-$second-$third';
  } else if (cleanDigits.length >= 6) {
    final area = cleanDigits.substring(0, 3);
    final first = cleanDigits.substring(3, 6);
    final rest = cleanDigits.substring(6);
    return '+7 ($area) $first-$rest';
  } else if (cleanDigits.length >= 3) {
    final area = cleanDigits.substring(0, 3);
    final rest = cleanDigits.substring(3);
    return '+7 ($area) $rest';
  } else {
    return '+7 $cleanDigits';
  }
}

/// Из номера с API возвращает строку для поля с маской (###) ###-##-## (только 10 цифр).
String phoneToMaskedInput(String? apiPhone) {
  if (apiPhone == null || apiPhone.isEmpty) return '';
  String digits = apiPhone.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.startsWith('8') && digits.length >= 11) digits = digits.substring(1);
  if (digits.startsWith('7') && digits.length >= 11) digits = digits.substring(1);
  if (digits.length < 10) return digits;
  final d = digits.length > 10 ? digits.substring(0, 10) : digits;
  return '(${d.substring(0, 3)}) ${d.substring(3, 6)}-${d.substring(6, 8)}-${d.substring(8, 10)}';
}

/// Из значения поля с маской (###) ###-##-## возвращает номер для API (+7XXXXXXXXXX).
String phoneFromMaskedInput(String masked) {
  final digits = masked.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.isEmpty) return '';
  if (digits.length >= 10) {
    final ten = digits.length > 10 ? digits.substring(0, 10) : digits;
    return '+7$ten';
  }
  return '+7$digits';
}

/// Форматирует дату из API (yyyy-MM-dd или ISO) в вид дд.мм.гггг
String formatDateToDisplay(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) return '';
  final d = DateTime.tryParse(dateStr);
  if (d == null) return dateStr;
  return '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';
}

/// Форматирует год в вид дд.мм.гггг (01.01.yyyy) для единообразия вывода дат
String formatYearToDisplay(int? year) {
  if (year == null) return '';
  return '01.01.$year';
}

/// Форматирует цену с разделителями тысяч без копеек
String formatPrice(int price) {
  final format = NumberFormat('#,##0', 'ru_RU');
  return format.format(price);
}

/// Преобразует код валюты в символ
String getCurrencySymbol(String currency) {
  switch (currency.toUpperCase()) {
    case 'RUB':
      return '₽';
    case 'USD':
      return '\$';
    case 'EUR':
      return '€';
    default:
      return currency; // Если валюта неизвестна, возвращаем код
  }
}

/// Форматирует дату в формат дд.мм.гггг
String formatDate(DateTime? date) {
  if (date == null) return '';
  return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
}

/// Форматирует дату и время в формат дд.мм.гггг чч:мм
String formatDateWithTime(DateTime? date) {
  if (date == null) return '';
  final dateStr = formatDate(date);
  return '$dateStr ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
}

/// Форматирует строковую дату новости в формат дд.мм.гггг
/// Поддерживает ISO формат (2026-01-25T17:52:06.765608) и формат дд.мм.гггг
String formatNewsDate(String date) {
  if (date.isEmpty) return '';

  // Пробуем распарсить ISO формат
  final isoDate = DateTime.tryParse(date);
  if (isoDate != null) {
    return formatDate(isoDate);
  }

  // Если уже в формате дд.мм.гггг, возвращаем как есть
  // Проверяем формат дд.мм.гггг
  final parts = date.split('.');
  if (parts.length == 3) {
    try {
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      if (day > 0 && day <= 31 && month > 0 && month <= 12 && year > 1900) {
        return date.split(' ').first; // Возвращаем только дату без времени, если есть
      }
    } catch (_) {
      // Если не удалось распарсить, возвращаем как есть
    }
  }

  // Если не удалось распарсить, возвращаем исходную строку
  return date;
}
