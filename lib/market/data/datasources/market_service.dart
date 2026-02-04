import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:aviapoint/market/data/models/market_category_dto.dart';
import 'package:aviapoint/market/data/models/aircraft_market_dto.dart';
import 'package:aviapoint/market/data/models/parts_market_dto.dart';
import 'package:aviapoint/market/data/models/parts_manufacturer_dto.dart';
import 'package:aviapoint/market/data/models/price_history_dto.dart';
import 'package:aviapoint/blog/data/models/upload_image_response_dto.dart';
import 'package:aviapoint/market/data/models/upload_images_response_dto.dart';

part 'market_service.g.dart';

@RestApi()
abstract class MarketService {
  factory MarketService(Dio dio, {String baseUrl}) = _MarketService;

  @GET('/api/market/categories/main')
  Future<List<MarketCategoryDto>> getMainCategories(@Query('product_type') String productType);

  @GET('/api/market/categories')
  Future<List<MarketCategoryDto>> getAllCategories(@Query('product_type') String productType);

  @GET('/api/market/categories/{id}')
  Future<MarketCategoryDto> getCategoryById(@Path('id') int id);

  @GET('/api/market/aircraft')
  Future<List<AircraftMarketDto>> getProducts({
    @Query('aircraft_subcategories_id') int? aircraftSubcategoriesId,
    @Query('aircraft_subcategories_ids') String? aircraftSubcategoriesIds, // Список через запятую
    @Query('seller_id') int? sellerId,
    @Query('search') String? searchQuery,
    @Query('price_from') int? priceFrom,
    @Query('price_to') int? priceTo,
    @Query('brand') String? brand,
    @Query('sort_by') String? sortBy,
    @Query('include_inactive') bool? includeInactive,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('/api/market/aircraft/{id}')
  Future<AircraftMarketDto> getProductById(@Path('id') int id);

  @GET('/api/market/aircraft/{id}/price-history')
  Future<List<PriceHistoryDto>> getPriceHistory(@Path('id') int id);

  @POST('/api/market/products/{id}/favorite')
  Future<void> addToFavorites(@Path('id') int id);

  @DELETE('/api/market/products/{id}/favorite')
  Future<void> removeFromFavorites(@Path('id') int id);

  @GET('/api/market/favorites')
  Future<List<AircraftMarketDto>> getFavoriteProducts({@Query('product_type') String? productType, @Query('limit') int? limit, @Query('offset') int? offset});

  @POST('/api/market/aircraft')
  Future<AircraftMarketDto> createAirCraft(@Body() Map<String, dynamic> body);

  @PUT('/api/market/aircraft/{id}')
  Future<AircraftMarketDto> updateProduct(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/market/aircraft/{id}')
  Future<void> deleteProduct(@Path('id') int id);

  @POST('/api/market/aircraft/{id}/publish')
  Future<AircraftMarketDto> publishProduct(@Path('id') int id);

  @POST('/api/market/aircraft/{id}/unpublish')
  Future<AircraftMarketDto> unpublishProduct(@Path('id') int id);

  @POST('/api/market/aircraft/{id}/deactivate')
  Future<AircraftMarketDto> deactivateProduct(@Path('id') int id);

  @POST('/api/market/aircraft/{id}/activate')
  Future<AircraftMarketDto> activateProduct(@Path('id') int id);

  /// Загрузить основную фотографию товара
  @POST('/api/market/products/{id}/main-image')
  @MultiPart()
  Future<UploadImageResponseDto> uploadMainImage(@Path('id') int id, @Part(name: 'image') MultipartFile image);

  /// Загрузить дополнительные фотографии товара
  @POST('/api/market/products/{id}/additional-images')
  @MultiPart()
  Future<UploadImagesResponseDto> uploadAdditionalImages(@Path('id') int id, @Part(name: 'images') List<MultipartFile> images);

  // ========== PARTS ENDPOINTS ==========

  @GET('/api/market/parts/main-categories')
  Future<List<MarketCategoryDto>> getPartsMainCategories();

  @GET('/api/market/parts/subcategories')
  Future<List<MarketCategoryDto>> getPartsSubcategories({
    @Query('parent_id') int? parentId,
    @Query('main_category_id') int? mainCategoryId,
  });

  @GET('/api/market/parts/manufacturers')
  Future<List<PartsManufacturerDto>> getPartsManufacturers({
    @Query('search') String? search,
  });

  @GET('/api/market/parts')
  Future<List<PartsMarketDto>> getParts({
    @Query('main_category_id') int? mainCategoryId,
    @Query('subcategory_id') int? subcategoryId, // На бэкенде это subcategory_id
    @Query('seller_id') int? sellerId,
    @Query('manufacturer_id') int? manufacturerId,
    @Query('search') String? searchQuery,
    @Query('condition') String? condition,
    @Query('price_from') int? priceFrom,
    @Query('price_to') int? priceTo,
    @Query('sort_by') String? sortBy,
    @Query('include_inactive') bool? includeInactive,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('/api/market/parts/{id}')
  Future<PartsMarketDto> getPartById(@Path('id') int id);

  @GET('/api/market/parts/{id}/price-history')
  Future<List<PriceHistoryDto>> getPartPriceHistory(@Path('id') int id);

  @POST('/api/market/parts')
  Future<PartsMarketDto> createPart(@Body() Map<String, dynamic> body);

  @PUT('/api/market/parts/{id}')
  Future<PartsMarketDto> updatePart(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/market/parts/{id}')
  Future<void> deletePart(@Path('id') int id);

  @POST('/api/market/parts/{id}/publish')
  Future<PartsMarketDto> publishPart(@Path('id') int id);

  @POST('/api/market/parts/{id}/unpublish')
  Future<PartsMarketDto> unpublishPart(@Path('id') int id);

  @POST('/api/market/parts/{id}/favorite')
  Future<void> addPartToFavorites(@Path('id') int id);

  @DELETE('/api/market/parts/{id}/favorite')
  Future<void> removePartFromFavorites(@Path('id') int id);

  @GET('/api/market/parts/favorites')
  Future<List<PartsMarketDto>> getFavoriteParts({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });
}
