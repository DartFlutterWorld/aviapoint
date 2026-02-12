import 'package:equatable/equatable.dart';
import 'package:aviapoint/market/domain/entities/market_address_entity.dart';

class PartsMarketEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final int price;
  final int? partsSubcategoryId;
  final int? partsMainCategoryId;
  final int sellerId;
  final int? manufacturerId;
  final String? manufacturerName;
  final String? location;
  // Структурированный адрес (если пришёл с бэка)
  final MarketAddressEntity? address;

  // Изображения (разделены)
  final String? mainImageUrl; // Основное фото
  final List<String> additionalImageUrls; // Дополнительные фото

  // Специфичные для запчастей
  final String? partNumber;
  final String? oemNumber;
  final String? condition;
  final int quantity;
  final String currency;
  final double? weightKg;
  final double? dimensionsLengthCm;
  final double? dimensionsWidthCm;
  final double? dimensionsHeightCm;
  final String? compatibleAircraftModelsText;
  final List<int>? compatibleAircraftModelIds;

  // Статусы
  final bool isPublished;
  final bool isActive;
  final DateTime? publishedUntil;
  final int viewsCount;
  final int favoritesCount;
  final bool? isFavorite;

  // Контактная информация продавца (из JOIN с profiles)
  final String? sellerFirstName;
  final String? sellerLastName;
  final String? sellerPhone;
  final String? sellerTelegram;
  final String? sellerMax;

  // Названия категорий (из JOIN)
  final String? mainCategoryName;
  final String? subcategoryName;
  final String? manufacturerNameDisplay;

  // Метаданные
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? soldAt;

  // Геттер для полного имени продавца
  String? get sellerFullName {
    if (sellerFirstName != null && sellerLastName != null) {
      return '$sellerFirstName $sellerLastName';
    }
    return sellerFirstName ?? sellerLastName;
  }

  const PartsMarketEntity({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.partsSubcategoryId,
    this.partsMainCategoryId,
    required this.sellerId,
    this.manufacturerId,
    this.manufacturerName,
    this.location,
    this.address,
    this.mainImageUrl,
    this.additionalImageUrls = const [],
    this.partNumber,
    this.oemNumber,
    this.condition,
    this.quantity = 1,
    this.currency = 'RUB',
    this.weightKg,
    this.dimensionsLengthCm,
    this.dimensionsWidthCm,
    this.dimensionsHeightCm,
    this.compatibleAircraftModelsText,
    this.compatibleAircraftModelIds,
    this.isPublished = false,
    this.isActive = true,
    this.publishedUntil,
    this.viewsCount = 0,
    this.favoritesCount = 0,
    this.isFavorite,
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    this.mainCategoryName,
    this.subcategoryName,
    this.manufacturerNameDisplay,
    this.createdAt,
    this.updatedAt,
    this.soldAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    partsSubcategoryId,
    partsMainCategoryId,
    sellerId,
    manufacturerId,
    manufacturerName,
    location,
    mainImageUrl,
    additionalImageUrls,
    partNumber,
    oemNumber,
    condition,
    quantity,
    currency,
    weightKg,
    dimensionsLengthCm,
    dimensionsWidthCm,
    dimensionsHeightCm,
    compatibleAircraftModelsText,
    compatibleAircraftModelIds,
    isPublished,
    isActive,
    publishedUntil,
    viewsCount,
    favoritesCount,
    isFavorite,
    sellerFirstName,
    sellerLastName,
    sellerPhone,
    sellerTelegram,
    sellerMax,
    mainCategoryName,
    subcategoryName,
    manufacturerNameDisplay,
    createdAt,
    updatedAt,
    soldAt,
  ];
}
