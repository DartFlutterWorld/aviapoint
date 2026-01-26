import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
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
    int? aircraftSubcategoriesId,
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

  Future<Either<Failure, AircraftMarketEntity>> updateProduct({
    required int productId,
    String? title,
    String? description,
    int? price,
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

  /// Загрузить основную фотографию товара
  Future<Either<Failure, String>> uploadMainImage(int productId, XFile imageFile);

  /// Загрузить дополнительные фотографии товара
  Future<Either<Failure, List<String>>> uploadAdditionalImages(int productId, List<XFile> imageFiles);

  /// Получить историю цен для объявления
  Future<Either<Failure, List<PriceHistoryEntity>>> getPriceHistory(int productId);
}
