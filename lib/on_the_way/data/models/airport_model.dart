class AirportModel {
  // Основные поля
  final int id;
  final String code; // ident
  final String? identRu; // Русский код
  final String type; // Тип: вертодром, аэродром и т.д.
  final String name;
  final String? nameEng; // Английское название
  final String? city;
  final String? country;
  final String? countryCode; // Код страны (UU, RU и т.д.)
  final String? countryEng; // Английское название страны
  final String? region; // Регион
  final String? regionEng; // Английское название региона
  final String? coordinatesText; // КТА
  final String? continent; // Континент

  // Координаты
  final double? latitudeDeg;
  final double? longitudeDeg;
  final int? elevationFt; // Высота над уровнем моря в футах

  // Дополнительная информация
  final String? ownership; // Принадлежность
  final bool isInternational; // Международный ли аэропорт
  final String? email;
  final String? website;
  final String? notes;

  // Данные о ВПП
  final String? runwayName;
  final int? runwayLength;
  final int? runwayWidth;
  final String? runwaySurface;
  final String? runwayMagneticCourse;
  final String? runwayLighting;

  // Коды
  final String? gpsCode;
  final String? iataCode;
  final String? localCode;

  // Дополнительные поля
  final Map<String, dynamic>? services; // Услуги
  final int? ownerId;
  final bool isVerified;
  final List<String>? photos; // Массив URL официальных фотографий
  final List<String>? visitorPhotos; // Массив URL фотографий посетителей
  final bool isActive;
  final String? source;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AirportModel({
    required this.id,
    required this.code,
    this.identRu,
    required this.type,
    required this.name,
    this.nameEng,
    this.city,
    this.country,
    this.countryCode,
    this.countryEng,
    this.region,
    this.regionEng,
    this.coordinatesText,
    this.continent,
    this.latitudeDeg,
    this.longitudeDeg,
    this.elevationFt,
    this.ownership,
    this.isInternational = false,
    this.email,
    this.website,
    this.notes,
    this.runwayName,
    this.runwayLength,
    this.runwayWidth,
    this.runwaySurface,
    this.runwayMagneticCourse,
    this.runwayLighting,
    this.gpsCode,
    this.iataCode,
    this.localCode,
    this.services,
    this.ownerId,
    this.isVerified = false,
    this.photos,
    this.visitorPhotos,
    this.isActive = true,
    this.source,
    this.createdAt,
    this.updatedAt,
  });

  String get displayName => '$code - $name${city != null ? ' ($city)' : ''}';

  /// Полное отображение с дополнительной информацией
  String get fullDisplayName {
    final parts = <String>[];
    parts.add(code);
    if (identRu != null && identRu != code) {
      parts.add('($identRu)');
    }
    parts.add('- $name');
    if (city != null) {
      parts.add('($city)');
    }
    if (region != null) {
      parts.add('[$region]');
    }
    return parts.join(' ');
  }

  /// Тип аэропорта на русском
  String get typeDisplay {
    switch (type.toLowerCase()) {
      case 'heliport':
      case 'вертодром':
        return 'Вертодром';
      case 'airport':
      case 'аэродром':
        return 'Аэродром';
      case 'small_airport':
        return 'Малый аэродром';
      case 'medium_airport':
        return 'Средний аэродром';
      case 'large_airport':
        return 'Крупный аэродром';
      default:
        return type;
    }
  }
}
