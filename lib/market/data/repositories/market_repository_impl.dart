import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/data/datasources/market_service.dart';
import 'package:aviapoint/market/data/models/aircraft_market_dto.dart';
import 'package:aviapoint/market/data/repositories/mappers/market_category_mapper.dart';
import 'package:aviapoint/market/data/repositories/mappers/aircraft_market_mapper.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/price_history_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MarketRepositoryImpl implements MarketRepository {
  final MarketService _service;
  final Dio _dio;

  MarketRepositoryImpl({required MarketService marketService}) : _service = marketService, _dio = (getIt<ApiDatasource>() as ApiDatasourceDio).dio;

  @override
  Future<Either<Failure, List<MarketCategoryEntity>>> getMainCategories(String productType) async {
    try {
      final categories = await _service.getMainCategories(productType);
      return right(MarketCategoryMapper.toEntities(categories));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<MarketCategoryEntity>>> getAllCategories(String productType) async {
    try {
      final categories = await _service.getAllCategories(productType);
      return right(MarketCategoryMapper.toEntities(categories));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, MarketCategoryEntity>> getCategoryById(int id) async {
    try {
      final category = await _service.getCategoryById(id);
      return right(MarketCategoryMapper.toEntity(category));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Category not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
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
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final aircraftSubcategoriesIdsStr = aircraftSubcategoriesIds != null && aircraftSubcategoriesIds.isNotEmpty ? aircraftSubcategoriesIds.map((e) => e.toString()).join(',') : null;

      final products = await _service.getProducts(
        aircraftSubcategoriesId: aircraftSubcategoriesId,
        aircraftSubcategoriesIds: aircraftSubcategoriesIdsStr,
        sellerId: sellerId,
        searchQuery: searchQuery,
        priceFrom: priceFrom,
        priceTo: priceTo,
        brand: brand,
        sortBy: sortBy,
        includeInactive: includeInactive,
        limit: limit,
        offset: offset,
      );
      return right(AircraftMarketMapper.toEntities(products));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, AircraftMarketEntity>> getProductById(int id) async {
    try {
      final product = await _service.getProductById(id);
      return right(AircraftMarketMapper.toEntity(product));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorites(int productId) async {
    try {
      await _service.addToFavorites(productId);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(int productId) async {
    try {
      await _service.removeFromFavorites(productId);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<AircraftMarketEntity>>> getFavoriteProducts({String? productType, int limit = 20, int offset = 0}) async {
    try {
      final products = await _service.getFavoriteProducts(productType: productType, limit: limit, offset: offset);
      return right(AircraftMarketMapper.toEntities(products));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
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
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
  }) async {
    try {
      AircraftMarketDto response;

      // Если есть файлы изображений, отправляем через FormData
      final hasMainImageFile = mainImageFile != null;
      final hasAdditionalImageFiles = additionalImageFiles?.isNotEmpty ?? false;

      if (hasMainImageFile || hasAdditionalImageFiles) {
        final formData = FormData();

        // Добавляем текстовые поля
        formData.fields.add(MapEntry('title', title));
        if (description != null && description.isNotEmpty) formData.fields.add(MapEntry('description', description));
        formData.fields.add(MapEntry('price', price.toString()));
        if (aircraftSubcategoriesId != null) formData.fields.add(MapEntry('aircraft_subcategories_id', aircraftSubcategoriesId.toString()));
        if (brand != null && brand.isNotEmpty) formData.fields.add(MapEntry('brand', brand));
        if (location != null && location.isNotEmpty) formData.fields.add(MapEntry('location', location));
        if (year != null) formData.fields.add(MapEntry('year', year.toString()));
        if (totalFlightHours != null) formData.fields.add(MapEntry('total_flight_hours', totalFlightHours.toString()));
        if (enginePower != null) formData.fields.add(MapEntry('engine_power', enginePower.toString()));
        if (engineVolume != null) formData.fields.add(MapEntry('engine_volume', engineVolume.toString()));
        if (seats != null) formData.fields.add(MapEntry('seats', seats.toString()));
        if (condition != null) formData.fields.add(MapEntry('condition', condition));
        if (isShareSale != null) formData.fields.add(MapEntry('is_share_sale', isShareSale.toString()));
        if (shareNumerator != null) formData.fields.add(MapEntry('share_numerator', shareNumerator.toString()));
        if (shareDenominator != null) formData.fields.add(MapEntry('share_denominator', shareDenominator.toString()));
        if (isLeasing != null) formData.fields.add(MapEntry('is_leasing', isLeasing.toString()));
        if (leasingConditions != null && leasingConditions.isNotEmpty) {
          formData.fields.add(MapEntry('leasing_conditions', leasingConditions));
        }

        // Добавляем основное изображение
        if (hasMainImageFile) {
          MultipartFile multipartFile;
          if (kIsWeb) {
            final bytes = await mainImageFile.readAsBytes();
            multipartFile = MultipartFile.fromBytes(bytes, filename: mainImageFile.name);
          } else {
            final file = File(mainImageFile.path);
            multipartFile = await MultipartFile.fromFile(file.path, filename: mainImageFile.name);
          }
          formData.files.add(MapEntry('main_image', multipartFile));
        }

        // Добавляем дополнительные изображения
        if (hasAdditionalImageFiles && additionalImageFiles != null) {
          for (final file in additionalImageFiles) {
            MultipartFile multipartFile;
            if (kIsWeb) {
              final bytes = await file.readAsBytes();
              multipartFile = MultipartFile.fromBytes(bytes, filename: file.name);
            } else {
              final filePath = File(file.path);
              multipartFile = await MultipartFile.fromFile(filePath.path, filename: file.name);
            }
            formData.files.add(MapEntry('additional_images', multipartFile));
          }
        }

        // Отправляем через Dio напрямую
        try {
          final dioResponse = await _dio.post<Map<String, dynamic>>(
            '/api/market/aircraft',
            data: formData,
            options: Options(
              contentType: 'multipart/form-data',
              responseType: ResponseType.json,
              sendTimeout: const Duration(minutes: 2),
              receiveTimeout: const Duration(minutes: 2),
              validateStatus: (status) => status! < 500,
            ),
          );

          if (dioResponse.statusCode != null && dioResponse.statusCode! >= 400) {
            String? errorMessage;
            if (dioResponse.data != null) {
              if (dioResponse.data is Map) {
                final data = dioResponse.data as Map;
                errorMessage = data['error']?.toString() ?? data.toString();
              } else {
                errorMessage = dioResponse.data.toString();
              }
            }
            return left(ServerFailure(statusCode: dioResponse.statusCode.toString(), message: errorMessage ?? 'Ошибка при создании товара', responseMessage: errorMessage));
          }

          response = AircraftMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(ServerFailure(statusCode: '400', message: 'Ошибка декодирования ответа сервера', responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.'));
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{'title': title, 'price': price};
        if (description != null && description.isNotEmpty) body['description'] = description;
        if (aircraftSubcategoriesId != null) body['aircraft_subcategories_id'] = aircraftSubcategoriesId;
        if (brand != null && brand.isNotEmpty) body['brand'] = brand;
        if (location != null && location.isNotEmpty) body['location'] = location;
        if (year != null) body['year'] = year;
        if (totalFlightHours != null) body['total_flight_hours'] = totalFlightHours;
        if (enginePower != null) body['engine_power'] = enginePower;
        if (engineVolume != null) body['engine_volume'] = engineVolume;
        if (seats != null) body['seats'] = seats;
        if (condition != null) body['condition'] = condition;
        if (isShareSale != null) body['is_share_sale'] = isShareSale;
        if (shareNumerator != null) body['share_numerator'] = shareNumerator;
        if (shareDenominator != null) body['share_denominator'] = shareDenominator;
        if (isLeasing != null) body['is_leasing'] = isLeasing;
        if (leasingConditions != null && leasingConditions.isNotEmpty) {
          body['leasing_conditions'] = leasingConditions;
        }

        response = await _service.createAirCraft(body);
      }

      return right(AircraftMarketMapper.toEntity(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для создания товара'));
      }
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message, responseMessage: responseMessage));
    }
  }

  @override
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
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    bool? isLeasing,
    String? leasingConditions,
  }) async {
    try {
      AircraftMarketDto response;

      // Если есть файлы изображений, отправляем через FormData
      final hasMainImageFile = mainImageFile != null;
      final hasAdditionalImageFiles = additionalImageFiles?.isNotEmpty ?? false;

      if (hasMainImageFile || hasAdditionalImageFiles) {
        final formData = FormData();

        // Добавляем текстовые поля
        if (title != null) formData.fields.add(MapEntry('title', title));
        if (description != null) formData.fields.add(MapEntry('description', description));
        if (price != null) formData.fields.add(MapEntry('price', price.toString()));
        if (aircraftSubcategoriesId != null) formData.fields.add(MapEntry('aircraft_subcategories_id', aircraftSubcategoriesId.toString()));
        // Передаём mainImageUrl только если НЕТ нового файла (для удаления или сохранения старого URL)
        if (mainImageUrl != null && !hasMainImageFile) formData.fields.add(MapEntry('main_image_url', mainImageUrl));
        if (additionalImageUrls != null) {
          if (additionalImageUrls.isNotEmpty) {
            for (final url in additionalImageUrls) {
              formData.fields.add(MapEntry('additional_image_urls[]', url));
            }
          } else {
            // Передаем пустой список через специальное поле
            formData.fields.add(MapEntry('additional_image_urls', '[]'));
          }
        }
        if (brand != null) formData.fields.add(MapEntry('brand', brand));
        if (location != null) formData.fields.add(MapEntry('location', location));
        if (year != null) formData.fields.add(MapEntry('year', year.toString()));
        if (totalFlightHours != null) formData.fields.add(MapEntry('total_flight_hours', totalFlightHours.toString()));
        if (enginePower != null) formData.fields.add(MapEntry('engine_power', enginePower.toString()));
        if (engineVolume != null) formData.fields.add(MapEntry('engine_volume', engineVolume.toString()));
        if (seats != null) formData.fields.add(MapEntry('seats', seats.toString()));
        if (condition != null) formData.fields.add(MapEntry('condition', condition));
        if (isShareSale != null) formData.fields.add(MapEntry('is_share_sale', isShareSale.toString()));
        if (shareNumerator != null) formData.fields.add(MapEntry('share_numerator', shareNumerator.toString()));
        if (shareDenominator != null) formData.fields.add(MapEntry('share_denominator', shareDenominator.toString()));
        if (isLeasing != null) formData.fields.add(MapEntry('is_leasing', isLeasing.toString()));
        if (leasingConditions != null && leasingConditions.isNotEmpty) {
          formData.fields.add(MapEntry('leasing_conditions', leasingConditions));
        }

        // Добавляем основное изображение
        if (hasMainImageFile) {
          MultipartFile multipartFile;
          if (kIsWeb) {
            final bytes = await mainImageFile.readAsBytes();
            multipartFile = MultipartFile.fromBytes(bytes, filename: mainImageFile.name);
          } else {
            final file = File(mainImageFile.path);
            multipartFile = await MultipartFile.fromFile(file.path, filename: mainImageFile.name);
          }
          formData.files.add(MapEntry('main_image', multipartFile));
        }

        // Добавляем дополнительные изображения
        if (hasAdditionalImageFiles && additionalImageFiles != null) {
          for (final file in additionalImageFiles) {
            MultipartFile multipartFile;
            if (kIsWeb) {
              final bytes = await file.readAsBytes();
              multipartFile = MultipartFile.fromBytes(bytes, filename: file.name);
            } else {
              final filePath = File(file.path);
              multipartFile = await MultipartFile.fromFile(filePath.path, filename: file.name);
            }
            formData.files.add(MapEntry('additional_images', multipartFile));
          }
        }

        // Отправляем через Dio напрямую
        try {
          final dioResponse = await _dio.put<Map<String, dynamic>>(
            '/api/market/aircraft/$productId',
            data: formData,
            options: Options(
              contentType: 'multipart/form-data',
              responseType: ResponseType.json,
              sendTimeout: const Duration(minutes: 2),
              receiveTimeout: const Duration(minutes: 2),
              validateStatus: (status) => status! < 500,
            ),
          );

          if (dioResponse.statusCode != null && dioResponse.statusCode! >= 400) {
            String? errorMessage;
            if (dioResponse.data != null) {
              if (dioResponse.data is Map) {
                final data = dioResponse.data as Map;
                errorMessage = data['error']?.toString() ?? data.toString();
              } else {
                errorMessage = dioResponse.data.toString();
              }
            }
            return left(ServerFailure(statusCode: dioResponse.statusCode.toString(), message: errorMessage ?? 'Ошибка при обновлении товара', responseMessage: errorMessage));
          }

          response = AircraftMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(ServerFailure(statusCode: '400', message: 'Ошибка декодирования ответа сервера', responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.'));
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{};
        if (title != null) body['title'] = title;
        if (description != null) body['description'] = description;
        if (price != null) body['price'] = price;
        if (aircraftSubcategoriesId != null) body['aircraft_subcategories_id'] = aircraftSubcategoriesId;
        if (mainImageUrl != null) body['main_image_url'] = mainImageUrl;
        if (additionalImageUrls != null) body['additional_image_urls'] = additionalImageUrls;
        if (brand != null) body['brand'] = brand;
        if (location != null) body['location'] = location;
        if (year != null) body['year'] = year;
        if (totalFlightHours != null) body['total_flight_hours'] = totalFlightHours;
        if (enginePower != null) body['engine_power'] = enginePower;
        if (engineVolume != null) body['engine_volume'] = engineVolume;
        if (seats != null) body['seats'] = seats;
        if (condition != null) body['condition'] = condition;
        if (isShareSale != null) body['is_share_sale'] = isShareSale;
        if (shareNumerator != null) body['share_numerator'] = shareNumerator;
        if (shareDenominator != null) body['share_denominator'] = shareDenominator;
        if (isLeasing != null) body['is_leasing'] = isLeasing;
        if (leasingConditions != null && leasingConditions.isNotEmpty) {
          body['leasing_conditions'] = leasingConditions;
        }

        response = await _service.updateProduct(productId, body);
      }

      return right(AircraftMarketMapper.toEntity(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'You do not have permission to update this product'));
      }
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message, responseMessage: responseMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int productId) async {
    try {
      await _service.deleteProduct(productId);
      return right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'You do not have permission to delete this product'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, AircraftMarketEntity>> publishProduct(int productId) async {
    try {
      final product = await _service.publishProduct(productId);
      return right(AircraftMarketMapper.toEntity(product));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для публикации товара'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, AircraftMarketEntity>> unpublishProduct(int productId) async {
    try {
      final product = await _service.unpublishProduct(productId);
      return right(AircraftMarketMapper.toEntity(product));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для снятия публикации'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> uploadMainImage(int productId, XFile imageFile) async {
    try {
      MultipartFile multipartFile;
      if (kIsWeb) {
        final bytes = await imageFile.readAsBytes();
        multipartFile = MultipartFile.fromBytes(bytes, filename: imageFile.name);
      } else {
        final file = File(imageFile.path);
        multipartFile = await MultipartFile.fromFile(file.path, filename: imageFile.name);
      }

      final response = await _service.uploadMainImage(productId, multipartFile);

      if (response.url.isEmpty) {
        return left(ServerFailure(statusCode: null, message: 'Не удалось получить URL загруженного изображения'));
      }

      return right(response.url);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message, responseMessage: responseMessage));
    } catch (e) {
      return left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке изображения: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadAdditionalImages(int productId, List<XFile> imageFiles) async {
    try {
      final multipartFiles = await Future.wait(
        imageFiles.map((imageFile) async {
          if (kIsWeb) {
            final bytes = await imageFile.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: imageFile.name);
          } else {
            final file = File(imageFile.path);
            return await MultipartFile.fromFile(file.path, filename: imageFile.name);
          }
        }),
      );

      final response = await _service.uploadAdditionalImages(productId, multipartFiles);

      if (response.urls.isEmpty) {
        return left(ServerFailure(statusCode: null, message: 'Не удалось получить URL загруженных изображений'));
      }

      return right(response.urls);
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message, responseMessage: responseMessage));
    } catch (e) {
      return left(ServerFailure(statusCode: null, message: 'Ошибка при загрузке изображений: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PriceHistoryEntity>>> getPriceHistory(int productId) async {
    try {
      final priceHistory = await _service.getPriceHistory(productId);
      return right(priceHistory.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Price history not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }
}
