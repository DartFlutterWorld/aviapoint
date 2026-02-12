import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/entities/price_history_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class MarketRepository {
  Future<Either<Failure, List<MarketCategoryEntity>>> getMainCategories(String productType);
  Future<Either<Failure, List<MarketCategoryEntity>>> getAllCategories(String productType);
  Future<Either<Failure, MarketCategoryEntity>> getCategoryById(int id);

  Future<Either<Failure, List<AircraftMarketEntity>>> getProducts({
    int? aircraftSubcategoriesId,
    List<int>? aircraftSubcategoriesIds,
    int? sellerId,
    String? searchQuery,
    int? priceFrom,
    int? priceTo,
    String? brand,
    String? sortBy,
    bool includeInactive = false,
    int limit,
    int offset,
  });

  Future<Either<Failure, AircraftMarketEntity>> getProductById(int id);

  Future<Either<Failure, void>> addToFavorites(int productId);
  Future<Either<Failure, void>> removeFromFavorites(int productId);
  Future<Either<Failure, List<AircraftMarketEntity>>> getFavoriteProducts({String? productType, int limit, int offset});

  Future<Either<Failure, AircraftMarketEntity>> createAirCraft({
    required String title,
    String? description,
    required int price,
    String currency = 'RUB',
    int? aircraftSubcategoriesId,
    String? brand,
    String? location,
    Map<String, dynamic>? address,
    int? year,
    int? totalFlightHours,
    int? enginePower,
    int? engineVolume,
    int? seats,
    String? condition,
    bool? isShareSale,
    int? shareNumerator,
    int? shareDenominator,
    bool? isLeasing,
    String? leasingConditions,
    // Файлы изображений для загрузки
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    bool isPublished = true,
  });

  Future<Either<Failure, AircraftMarketEntity>> updateProduct({
    required int productId,
    String? title,
    String? description,
    int? price,
    String? currency,
    int? aircraftSubcategoriesId,
    String? mainImageUrl,
    List<String>? additionalImageUrls,
    String? brand,
    String? location,
    int? year,
    int? totalFlightHours,
    int? enginePower,
    int? engineVolume,
    int? seats,
    String? condition,
    bool? isShareSale,
    int? shareNumerator,
    int? shareDenominator,
    bool? isLeasing,
    String? leasingConditions,
    // Файлы изображений для загрузки
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  });

  Future<Either<Failure, void>> deleteProduct(int productId);

  Future<Either<Failure, AircraftMarketEntity>> publishProduct(int productId);

  Future<Either<Failure, AircraftMarketEntity>> unpublishProduct(int productId);

  Future<Either<Failure, AircraftMarketEntity>> deactivateProduct(int productId);

  Future<Either<Failure, AircraftMarketEntity>> activateProduct(int productId);

  /// Загрузить основную фотографию товара
  Future<Either<Failure, String>> uploadMainImage(int productId, XFile imageFile);

  /// Загрузить дополнительные фотографии товара
  Future<Either<Failure, List<String>>> uploadAdditionalImages(int productId, List<XFile> imageFiles);

  /// Получить историю цен для объявления о самолёте
  Future<Either<Failure, List<PriceHistoryEntity>>> getPriceHistory(int productId);

  /// Получить историю цен для объявления о запчасти
  Future<Either<Failure, List<PriceHistoryEntity>>> getPartPriceHistory(int partId);

  // ========== PARTS METHODS ==========

  Future<Either<Failure, List<MarketCategoryEntity>>> getPartsMainCategories();
  Future<Either<Failure, List<MarketCategoryEntity>>> getPartsSubcategories({int? parentId, int? mainCategoryId});
  Future<Either<Failure, List<Map<String, dynamic>>>> getPartsManufacturers({String? search});

  Future<Either<Failure, List<PartsMarketEntity>>> getParts({
    int? mainCategoryId,
    int? subcategoryId,
    int? sellerId,
    int? manufacturerId,
    String? searchQuery,
    String? condition,
    int? priceFrom,
    int? priceTo,
    String? sortBy,
    bool includeInactive = false,
    int limit = 20,
    int offset = 0,
  });

  Future<Either<Failure, PartsMarketEntity>> getPartById(int id);

  Future<Either<Failure, PartsMarketEntity>> createPart({
    required String title,
    String? description,
    required int price,
    String currency,
    int? partsMainCategoryId,
    int? partsSubcategoryId,
    int? manufacturerId,
    String? manufacturerName,
    String? partNumber,
    String? oemNumber,
    String? condition,
    int quantity,
    String? location,
    double? weightKg,
    double? dimensionsLengthCm,
    double? dimensionsWidthCm,
    double? dimensionsHeightCm,
    String? compatibleAircraftModelsText,
    List<int>? compatibleAircraftModelIds,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    bool isPublished = true,
  });

  Future<Either<Failure, PartsMarketEntity>> updatePart({
    required int partId,
    String? title,
    String? description,
    int? price,
    String? currency,
    int? partsMainCategoryId,
    int? partsSubcategoryId,
    int? manufacturerId,
    String? manufacturerName,
    String? partNumber,
    String? oemNumber,
    String? condition,
    int? quantity,
    String? location,
    Map<String, dynamic>? address,
    double? weightKg,
    double? dimensionsLengthCm,
    double? dimensionsWidthCm,
    double? dimensionsHeightCm,
    String? compatibleAircraftModelsText,
    List<int>? compatibleAircraftModelIds,
    String? mainImageUrl,
    List<String>? additionalImageUrls,
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  });

  Future<Either<Failure, void>> deletePart(int partId);
  Future<Either<Failure, PartsMarketEntity>> publishPart(int partId);
  Future<Either<Failure, PartsMarketEntity>> unpublishPart(int partId);
  Future<Either<Failure, void>> addPartToFavorites(int partId);
  Future<Either<Failure, void>> removePartFromFavorites(int partId);
  Future<Either<Failure, List<PartsMarketEntity>>> getFavoriteParts({int limit = 20, int offset = 0});
}
