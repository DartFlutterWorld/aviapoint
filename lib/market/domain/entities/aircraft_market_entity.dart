import 'package:equatable/equatable.dart';
import 'package:aviapoint/market/domain/entities/market_address_entity.dart';

class AircraftMarketEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final int price;
  final String currency;
  final int? aircraftSubcategoriesId; // Заменяет categoryId
  final int sellerId;

  // Изображения (разделены)
  final String? mainImageUrl; // Основное фото
  final List<String> additionalImageUrls; // Дополнительные фото

  final String? brand;
  final String? location;
  // Структурированный адрес (если пришёл с бэка)
  // Используется для более точного форматирования без дублей типа "Москва, Москва".
  final MarketAddressEntity? address;
  final bool isPublished;
  final bool isActive;
  final int viewsCount;
  final bool? isFavorite;

  // Характеристики самолёта
  final int? year;
  final int? totalFlightHours;
  final int? enginePower;
  final int? engineVolume;
  final int? seats;
  final String? condition;

  // Лизинг
  final bool? isLeasing;
  final String? leasingConditions;

  // Продажа доли
  final bool? isShareSale;
  final int? shareNumerator;
  final int? shareDenominator;

  // Контактная информация продавца (из JOIN с profiles)
  final String? sellerFirstName;
  final String? sellerLastName;
  final String? sellerPhone;
  final String? sellerTelegram;
  final String? sellerMax;

  // Метаданные
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedUntil;

  // Геттер для полного имени продавца
  String? get sellerFullName {
    if (sellerFirstName != null && sellerLastName != null) {
      return '$sellerFirstName $sellerLastName';
    }
    return sellerFirstName ?? sellerLastName;
  }

  const AircraftMarketEntity({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.currency = 'RUB',
    this.aircraftSubcategoriesId,
    required this.sellerId,
    this.mainImageUrl,
    this.additionalImageUrls = const [],
    this.brand,
    this.location,
    this.address,
    this.isPublished = true,
    this.isActive = true,
    this.viewsCount = 0,
    this.isFavorite,
    this.year,
    this.totalFlightHours,
    this.enginePower,
    this.engineVolume,
    this.seats,
    this.condition,
    this.isLeasing,
    this.leasingConditions,
    this.isShareSale,
    this.shareNumerator,
    this.shareDenominator,
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    this.createdAt,
    this.updatedAt,
    this.publishedUntil,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    currency,
    aircraftSubcategoriesId,
    sellerId,
    mainImageUrl,
    additionalImageUrls,
    brand,
    location,
    isPublished,
    isActive,
    viewsCount,
    isFavorite,
    year,
    totalFlightHours,
    enginePower,
    engineVolume,
    seats,
    condition,
    isLeasing,
    leasingConditions,
    isShareSale,
    shareNumerator,
    shareDenominator,
    sellerFirstName,
    sellerLastName,
    sellerPhone,
    sellerTelegram,
    sellerMax,
    createdAt,
    updatedAt,
    publishedUntil,
  ];
}
