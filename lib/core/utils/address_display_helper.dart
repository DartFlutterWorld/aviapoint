/// Общий хелпер для отображения адресов во всём приложении (маркет запчастей и авиатехники,
/// детальные страницы, раздел вакансий и др.). Убирает дубли типа «Москва, Москва».
class AddressDisplayHelper {
  AddressDisplayHelper._();

  /// Короткий адрес для карточек: только город или «город, регион» без повторений.
  /// Если [region] совпадает с [city] (без учёта регистра/пробелов), возвращается только [city].
  static String? shortDisplay(String? city, [String? region]) {
    final c = _trim(city);
    if (c == null || c.isEmpty) return null;
    final r = _trim(region);
    if (r == null || r.isEmpty) return c;
    if (_normalize(c) == _normalize(r)) return c;
    return '$c, $r';
  }

  /// Полный адрес для детальных страниц: все части без повторений.
  /// Порядок: улица, дом, город/регион (без дубля), индекс, страна.
  static String? fullDisplay({
    String? country,
    String? region,
    String? city,
    String? street,
    String? houseNumber,
    String? postcode,
  }) {
    final parts = <String>[];
    if (_trim(street) != null && _trim(street)!.isNotEmpty) {
      final streetPart = _trim(street)!;
      if (_trim(houseNumber) != null && _trim(houseNumber)!.isNotEmpty) {
        parts.add('$streetPart, ${_trim(houseNumber)!}');
      } else {
        parts.add(streetPart);
      }
    }
    final c = _trim(city);
    final r = _trim(region);
    if (c != null && c.isNotEmpty) {
      if (r != null && r.isNotEmpty && _normalize(c) != _normalize(r)) {
        parts.add('$c, $r');
      } else {
        parts.add(c);
      }
    } else if (r != null && r.isNotEmpty) {
      parts.add(r);
    }
    if (_trim(postcode) != null && _trim(postcode)!.isNotEmpty) {
      parts.add(_trim(postcode)!);
    }
    if (_trim(country) != null && _trim(country)!.isNotEmpty) {
      parts.add(_trim(country)!);
    }
    if (parts.isEmpty) return null;
    return parts.join(', ');
  }

  /// Адрес для детальной страницы: регион (или город без дубля), улица, дом.
  /// Если регион и город совпадают — показывается один раз, без «Москва, Москва».
  static String? detailDisplay({
    String? region,
    String? city,
    String? street,
    String? houseNumber,
  }) {
    final parts = <String>[];
    final c = _trim(city);
    final r = _trim(region);
    if (c != null && c.isNotEmpty || r != null && r.isNotEmpty) {
      if (c != null && r != null && _normalize(c) == _normalize(r)) {
        parts.add(c);
      } else {
        if (r != null && r.isNotEmpty) parts.add(r);
        if (c != null && c.isNotEmpty && (r == null || _normalize(c) != _normalize(r))) {
          parts.add(c);
        }
      }
    }
    if (_trim(street) != null && _trim(street)!.isNotEmpty) {
      final streetPart = _trim(street)!;
      if (_trim(houseNumber) != null && _trim(houseNumber)!.isNotEmpty) {
        parts.add('$streetPart, ${_trim(houseNumber)!}');
      } else {
        parts.add(streetPart);
      }
    }
    if (parts.isEmpty) return null;
    return parts.join(', ');
  }

  /// Убирает повторяющиеся подряд части из строки адреса (например «Москва, Москва» → «Москва»).
  /// Используется для старого поля [location], когда структурированного [address] нет.
  static String? locationStringWithoutDuplicates(String? location) {
    if (location == null) return null;
    final trimmed = location.trim();
    if (trimmed.isEmpty) return null;
    final parts = trimmed.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
    if (parts.isEmpty) return null;
    final deduped = <String>[];
    for (final p in parts) {
      if (deduped.isEmpty || _normalize(deduped.last) != _normalize(p)) {
        deduped.add(p);
      }
    }
    return deduped.join(', ');
  }

  static String? _trim(String? s) {
    if (s == null) return null;
    final t = s.trim();
    return t.isEmpty ? null : t;
  }

  static String _normalize(String s) => s.trim().toLowerCase();
}
