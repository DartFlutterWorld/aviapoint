import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/data/datasources/market_service.dart';
import 'package:aviapoint/market/data/models/aircraft_market_dto.dart';
import 'package:aviapoint/market/data/models/parts_market_dto.dart';
import 'package:aviapoint/market/data/repositories/mappers/market_category_mapper.dart';
import 'package:aviapoint/market/data/repositories/mappers/aircraft_market_mapper.dart';
import 'package:aviapoint/market/data/repositories/mappers/parts_market_mapper.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/entities/price_history_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class MarketRepositoryImpl implements MarketRepository {
  final MarketService _service;
  final Dio _dio;

  MarketRepositoryImpl({required MarketService marketService})
    : _service = marketService,
      _dio = (getIt<ApiDatasource>() as ApiDatasourceDio).dio;

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
      final aircraftSubcategoriesIdsStr = aircraftSubcategoriesIds != null && aircraftSubcategoriesIds.isNotEmpty
          ? aircraftSubcategoriesIds.map((e) => e.toString()).join(',')
          : null;

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
  Future<Either<Failure, List<AircraftMarketEntity>>> getFavoriteProducts({
    String? productType,
    int limit = 20,
    int offset = 0,
  }) async {
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
    XFile? mainImageFile,
    List<XFile>? additionalImageFiles,
    bool isPublished = true,
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
        formData.fields.add(MapEntry('currency', currency));
        if (aircraftSubcategoriesId != null)
          formData.fields.add(MapEntry('aircraft_subcategories_id', aircraftSubcategoriesId.toString()));
        if (brand != null && brand.isNotEmpty) formData.fields.add(MapEntry('brand', brand));
        if (location != null && location.isNotEmpty) formData.fields.add(MapEntry('location', location));
        if (address != null) {
          formData.fields.add(MapEntry('address', jsonEncode(address)));
        }
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
        // Добавляем флаг публикации
        formData.fields.add(MapEntry('is_published', isPublished.toString()));

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
            return left(
              ServerFailure(
                statusCode: dioResponse.statusCode.toString(),
                message: errorMessage ?? 'Ошибка при создании товара',
                responseMessage: errorMessage,
              ),
            );
          }

          response = AircraftMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(
            ServerFailure(
              statusCode: '400',
              message: 'Ошибка декодирования ответа сервера',
              responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
            ),
          );
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{'title': title, 'price': price, 'currency': currency};
        if (description != null && description.isNotEmpty) body['description'] = description;
        if (aircraftSubcategoriesId != null) body['aircraft_subcategories_id'] = aircraftSubcategoriesId;
        if (brand != null && brand.isNotEmpty) body['brand'] = brand;
        if (location != null && location.isNotEmpty) body['location'] = location;
        if (address != null) body['address'] = address;
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
        body['is_published'] = isPublished;

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
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
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
        if (currency != null) formData.fields.add(MapEntry('currency', currency));
        if (aircraftSubcategoriesId != null)
          formData.fields.add(MapEntry('aircraft_subcategories_id', aircraftSubcategoriesId.toString()));
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
            return left(
              ServerFailure(
                statusCode: dioResponse.statusCode.toString(),
                message: errorMessage ?? 'Ошибка при обновлении товара',
                responseMessage: errorMessage,
              ),
            );
          }

          response = AircraftMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(
            ServerFailure(
              statusCode: '400',
              message: 'Ошибка декодирования ответа сервера',
              responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
            ),
          );
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{};
        if (title != null) body['title'] = title;
        if (description != null) body['description'] = description;
        if (price != null) body['price'] = price;
        if (currency != null) body['currency'] = currency;
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
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
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
  Future<Either<Failure, AircraftMarketEntity>> deactivateProduct(int productId) async {
    try {
      final product = await _service.deactivateProduct(productId);
      return right(AircraftMarketMapper.toEntity(product));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для блокировки'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Product not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, AircraftMarketEntity>> activateProduct(int productId) async {
    try {
      final product = await _service.activateProduct(productId);
      return right(AircraftMarketMapper.toEntity(product));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для разблокировки'));
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
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
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
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
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

  @override
  Future<Either<Failure, List<PriceHistoryEntity>>> getPartPriceHistory(int partId) async {
    try {
      final priceHistory = await _service.getPartPriceHistory(partId);
      return right(priceHistory.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Price history not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  // ========== PARTS METHODS ==========

  @override
  Future<Either<Failure, List<MarketCategoryEntity>>> getPartsMainCategories() async {
    try {
      final categories = await _service.getPartsMainCategories();
      return right(MarketCategoryMapper.toEntities(categories));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<MarketCategoryEntity>>> getPartsSubcategories({
    int? parentId,
    int? mainCategoryId,
  }) async {
    try {
      print('🔵 [MarketRepository] getPartsSubcategories: parentId=$parentId, mainCategoryId=$mainCategoryId');
      final categories = await _service.getPartsSubcategories(parentId: parentId, mainCategoryId: mainCategoryId);
      print('🔵 [MarketRepository] Получено категорий: ${categories.length}');
      final entities = MarketCategoryMapper.toEntities(categories);
      print('🔵 [MarketRepository] Преобразовано в entities: ${entities.length}');
      return right(entities);
    } on DioException catch (e) {
      print('🔴 [MarketRepository] Ошибка DioException: ${e.message}, statusCode: ${e.response?.statusCode}');
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getPartsManufacturers({String? search}) async {
    try {
      final manufacturers = await _service.getPartsManufacturers(search: search);
      return right(
        manufacturers
            .map((dto) => {'id': dto.id, 'name': dto.name, 'name_en': dto.nameEn, 'country': dto.country})
            .toList(),
      );
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
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
  }) async {
    try {
      final parts = await _service.getParts(
        mainCategoryId: mainCategoryId,
        subcategoryId: subcategoryId,
        sellerId: sellerId,
        manufacturerId: manufacturerId,
        searchQuery: searchQuery,
        condition: condition,
        priceFrom: priceFrom,
        priceTo: priceTo,
        sortBy: sortBy,
        includeInactive: includeInactive,
        limit: limit,
        offset: offset,
      );
      return right(PartsMarketMapper.toEntityList(parts));
    } on DioException catch (e) {
      String errorMessage = 'Ошибка загрузки запчастей';
      if (e.response?.statusCode != null) {
        errorMessage = 'Ошибка сервера (${e.response?.statusCode})';
        if (e.response?.data != null) {
          try {
            final data = e.response!.data;
            if (data is Map && data['error'] != null) {
              errorMessage = data['error'].toString();
            } else if (data is Map && data['message'] != null) {
              errorMessage = data['message'].toString();
            }
          } catch (_) {}
        }
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: errorMessage));
    }
  }

  @override
  Future<Either<Failure, PartsMarketEntity>> getPartById(int id) async {
    try {
      final part = await _service.getPartById(id);
      return right(PartsMarketMapper.toEntity(part));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Part not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, PartsMarketEntity>> createPart({
    required String title,
    String? description,
    required int price,
    String currency = 'RUB',
    int? partsMainCategoryId,
    int? partsSubcategoryId,
    int? manufacturerId,
    String? manufacturerName,
    String? partNumber,
    String? oemNumber,
    String? condition,
    int quantity = 1,
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
  }) async {
    try {
      PartsMarketDto response;
      final hasMainImageFile = mainImageFile != null;
      final hasAdditionalImageFiles = additionalImageFiles != null && additionalImageFiles.isNotEmpty;

      if (hasMainImageFile || hasAdditionalImageFiles) {
        // Если есть файлы, отправляем через FormData
        final formData = FormData();

        // Добавляем текстовые поля
        formData.fields.add(MapEntry('title', title));
        formData.fields.add(MapEntry('price', price.toString()));
        formData.fields.add(MapEntry('currency', currency));
        formData.fields.add(MapEntry('quantity', quantity.toString()));

        if (description != null && description.isNotEmpty) {
          formData.fields.add(MapEntry('description', description));
        }
        if (partsMainCategoryId != null) {
          formData.fields.add(MapEntry('parts_main_category_id', partsMainCategoryId.toString()));
        }
        if (partsSubcategoryId != null) {
          formData.fields.add(MapEntry('parts_subcategory_id', partsSubcategoryId.toString()));
        }
        if (manufacturerId != null) {
          formData.fields.add(MapEntry('manufacturer_id', manufacturerId.toString()));
        }
        if (manufacturerName != null && manufacturerName.isNotEmpty) {
          formData.fields.add(MapEntry('manufacturer_name', manufacturerName));
        }
        if (partNumber != null && partNumber.isNotEmpty) {
          formData.fields.add(MapEntry('part_number', partNumber));
        }
        if (oemNumber != null && oemNumber.isNotEmpty) {
          formData.fields.add(MapEntry('oem_number', oemNumber));
        }
        if (condition != null && condition.isNotEmpty) {
          formData.fields.add(MapEntry('condition', condition));
        }
        if (location != null && location.isNotEmpty) {
          formData.fields.add(MapEntry('location', location));
        }
        if (weightKg != null) {
          formData.fields.add(MapEntry('weight_kg', weightKg.toString()));
        }
        if (dimensionsLengthCm != null) {
          formData.fields.add(MapEntry('dimensions_length_cm', dimensionsLengthCm.toString()));
        }
        if (dimensionsWidthCm != null) {
          formData.fields.add(MapEntry('dimensions_width_cm', dimensionsWidthCm.toString()));
        }
        if (dimensionsHeightCm != null) {
          formData.fields.add(MapEntry('dimensions_height_cm', dimensionsHeightCm.toString()));
        }
        if (compatibleAircraftModelsText != null && compatibleAircraftModelsText.isNotEmpty) {
          formData.fields.add(MapEntry('compatible_aircraft_models_text', compatibleAircraftModelsText));
        }
        // Отправляем compatible_aircraft_model_ids как массив (каждое значение отдельным полем)
        // Бэкенд ожидает массив, поэтому отправляем каждое значение отдельно
        if (compatibleAircraftModelIds != null && compatibleAircraftModelIds.isNotEmpty) {
          for (final id in compatibleAircraftModelIds) {
            formData.fields.add(MapEntry('compatible_aircraft_model_ids[]', id.toString()));
          }
        }
        // Добавляем флаг публикации
        formData.fields.add(MapEntry('is_published', isPublished.toString()));

        // Добавляем основное изображение
        if (hasMainImageFile && mainImageFile != null) {
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
            '/api/market/parts',
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
            return left(
              ServerFailure(
                statusCode: dioResponse.statusCode.toString(),
                message: errorMessage ?? 'Ошибка при создании запчасти',
                responseMessage: errorMessage,
              ),
            );
          }

          response = PartsMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(
            ServerFailure(
              statusCode: '400',
              message: 'Ошибка декодирования ответа сервера',
              responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
            ),
          );
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{'title': title, 'price': price, 'currency': currency, 'quantity': quantity};
        if (description != null && description.isNotEmpty) body['description'] = description;
        if (partsMainCategoryId != null) body['parts_main_category_id'] = partsMainCategoryId;
        if (partsSubcategoryId != null) body['parts_subcategory_id'] = partsSubcategoryId;
        if (manufacturerId != null) body['manufacturer_id'] = manufacturerId;
        if (manufacturerName != null && manufacturerName.isNotEmpty) body['manufacturer_name'] = manufacturerName;
        if (partNumber != null && partNumber.isNotEmpty) body['part_number'] = partNumber;
        if (oemNumber != null && oemNumber.isNotEmpty) body['oem_number'] = oemNumber;
        if (condition != null && condition.isNotEmpty) body['condition'] = condition;
        if (location != null && location.isNotEmpty) body['location'] = location;
        if (weightKg != null) body['weight_kg'] = weightKg;
        if (dimensionsLengthCm != null) body['dimensions_length_cm'] = dimensionsLengthCm;
        if (dimensionsWidthCm != null) body['dimensions_width_cm'] = dimensionsWidthCm;
        if (dimensionsHeightCm != null) body['dimensions_height_cm'] = dimensionsHeightCm;
        if (compatibleAircraftModelsText != null && compatibleAircraftModelsText.isNotEmpty) {
          body['compatible_aircraft_models_text'] = compatibleAircraftModelsText;
        }
        if (compatibleAircraftModelIds != null && compatibleAircraftModelIds.isNotEmpty) {
          body['compatible_aircraft_model_ids'] = compatibleAircraftModelIds;
        }
        body['is_published'] = isPublished;

        response = await _service.createPart(body);
      }

      return right(PartsMarketMapper.toEntity(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для создания запчасти'));
      }
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
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
  }) async {
    try {
      PartsMarketDto response;
      final hasMainImageFile = mainImageFile != null;
      final hasAdditionalImageFiles = additionalImageFiles != null && additionalImageFiles.isNotEmpty;

      if (hasMainImageFile || hasAdditionalImageFiles) {
        // Если есть файлы, отправляем через FormData
        final formData = FormData();

        // Добавляем текстовые поля
        if (title != null && title.isNotEmpty) {
          formData.fields.add(MapEntry('title', title));
        }
        if (price != null) {
          formData.fields.add(MapEntry('price', price.toString()));
        }
        if (currency != null && currency.isNotEmpty) {
          formData.fields.add(MapEntry('currency', currency));
        }
        if (quantity != null) {
          formData.fields.add(MapEntry('quantity', quantity.toString()));
        }
        if (description != null && description.isNotEmpty) {
          formData.fields.add(MapEntry('description', description));
        }
        if (partsMainCategoryId != null) {
          formData.fields.add(MapEntry('parts_main_category_id', partsMainCategoryId.toString()));
        }
        if (partsSubcategoryId != null) {
          formData.fields.add(MapEntry('parts_subcategory_id', partsSubcategoryId.toString()));
        }
        if (manufacturerId != null) {
          formData.fields.add(MapEntry('manufacturer_id', manufacturerId.toString()));
        }
        if (manufacturerName != null && manufacturerName.isNotEmpty) {
          formData.fields.add(MapEntry('manufacturer_name', manufacturerName));
        }
        if (partNumber != null && partNumber.isNotEmpty) {
          formData.fields.add(MapEntry('part_number', partNumber));
        }
        if (oemNumber != null && oemNumber.isNotEmpty) {
          formData.fields.add(MapEntry('oem_number', oemNumber));
        }
        if (condition != null && condition.isNotEmpty) {
          formData.fields.add(MapEntry('condition', condition));
        }
        if (location != null && location.isNotEmpty) {
          formData.fields.add(MapEntry('location', location));
        }
        if (weightKg != null) {
          formData.fields.add(MapEntry('weight_kg', weightKg.toString()));
        }
        if (dimensionsLengthCm != null) {
          formData.fields.add(MapEntry('dimensions_length_cm', dimensionsLengthCm.toString()));
        }
        if (dimensionsWidthCm != null) {
          formData.fields.add(MapEntry('dimensions_width_cm', dimensionsWidthCm.toString()));
        }
        if (dimensionsHeightCm != null) {
          formData.fields.add(MapEntry('dimensions_height_cm', dimensionsHeightCm.toString()));
        }
        if (compatibleAircraftModelsText != null && compatibleAircraftModelsText.isNotEmpty) {
          formData.fields.add(MapEntry('compatible_aircraft_models_text', compatibleAircraftModelsText));
        }
        // Отправляем compatible_aircraft_model_ids как массив (каждое значение отдельным полем)
        // Бэкенд ожидает массив, поэтому отправляем каждое значение отдельно
        if (compatibleAircraftModelIds != null && compatibleAircraftModelIds.isNotEmpty) {
          for (final id in compatibleAircraftModelIds) {
            formData.fields.add(MapEntry('compatible_aircraft_model_ids[]', id.toString()));
          }
        }
        if (address != null) {
          formData.fields.add(MapEntry('address', jsonEncode(address)));
        }
        if (mainImageUrl != null && mainImageUrl.isNotEmpty) {
          formData.fields.add(MapEntry('main_image_url', mainImageUrl));
        }
        if (additionalImageUrls != null && additionalImageUrls.isNotEmpty) {
          formData.fields.add(MapEntry('additional_image_urls', additionalImageUrls.join(',')));
        }

        // Добавляем основное изображение
        if (hasMainImageFile && mainImageFile != null) {
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
            '/api/market/parts/$partId',
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
            return left(
              ServerFailure(
                statusCode: dioResponse.statusCode.toString(),
                message: errorMessage ?? 'Ошибка при обновлении запчасти',
                responseMessage: errorMessage,
              ),
            );
          }

          response = PartsMarketDto.fromJson(dioResponse.data!);
        } on FormatException {
          return left(
            ServerFailure(
              statusCode: '400',
              message: 'Ошибка декодирования ответа сервера',
              responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
            ),
          );
        }
      } else {
        // Если нет файлов, отправляем JSON как обычно
        final body = <String, dynamic>{};
        if (title != null && title.isNotEmpty) body['title'] = title;
        if (description != null && description.isNotEmpty) body['description'] = description;
        if (price != null) body['price'] = price;
        if (currency != null && currency.isNotEmpty) body['currency'] = currency;
        if (quantity != null) body['quantity'] = quantity;
        if (partsMainCategoryId != null) body['parts_main_category_id'] = partsMainCategoryId;
        if (partsSubcategoryId != null) body['parts_subcategory_id'] = partsSubcategoryId;
        if (manufacturerId != null) body['manufacturer_id'] = manufacturerId;
        if (manufacturerName != null && manufacturerName.isNotEmpty) body['manufacturer_name'] = manufacturerName;
        if (partNumber != null && partNumber.isNotEmpty) body['part_number'] = partNumber;
        if (oemNumber != null && oemNumber.isNotEmpty) body['oem_number'] = oemNumber;
        if (condition != null && condition.isNotEmpty) body['condition'] = condition;
        if (location != null && location.isNotEmpty) body['location'] = location;
        if (address != null) body['address'] = address;
        if (weightKg != null) body['weight_kg'] = weightKg;
        if (dimensionsLengthCm != null) body['dimensions_length_cm'] = dimensionsLengthCm;
        if (dimensionsWidthCm != null) body['dimensions_width_cm'] = dimensionsWidthCm;
        if (dimensionsHeightCm != null) body['dimensions_height_cm'] = dimensionsHeightCm;
        if (compatibleAircraftModelsText != null && compatibleAircraftModelsText.isNotEmpty) {
          body['compatible_aircraft_models_text'] = compatibleAircraftModelsText;
        }
        if (compatibleAircraftModelIds != null && compatibleAircraftModelIds.isNotEmpty) {
          body['compatible_aircraft_model_ids'] = compatibleAircraftModelIds;
        }
        if (mainImageUrl != null && mainImageUrl.isNotEmpty) body['main_image_url'] = mainImageUrl;
        if (additionalImageUrls != null && additionalImageUrls.isNotEmpty) {
          body['additional_image_urls'] = additionalImageUrls;
        }

        response = await _service.updatePart(partId, body);
      }

      return right(PartsMarketMapper.toEntity(response));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для обновления запчасти'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Part not found'));
      }
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
          responseMessage: responseMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deletePart(int partId) async {
    try {
      await _service.deletePart(partId);
      return right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для удаления запчасти'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Part not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, PartsMarketEntity>> publishPart(int partId) async {
    try {
      final part = await _service.publishPart(partId);
      return right(PartsMarketMapper.toEntity(part));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для публикации'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Part not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, PartsMarketEntity>> unpublishPart(int partId) async {
    try {
      final part = await _service.unpublishPart(partId);
      return right(PartsMarketMapper.toEntity(part));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      if (e.response?.statusCode == 403) {
        return left(ServerFailure(statusCode: '403', message: 'Недостаточно прав для снятия публикации'));
      }
      if (e.response?.statusCode == 404) {
        return left(ServerFailure(statusCode: '404', message: 'Part not found'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addPartToFavorites(int partId) async {
    try {
      await _service.addPartToFavorites(partId);
      return right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> removePartFromFavorites(int partId) async {
    try {
      await _service.removePartFromFavorites(partId);
      return right(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<PartsMarketEntity>>> getFavoriteParts({int limit = 20, int offset = 0}) async {
    try {
      final parts = await _service.getFavoriteParts(limit: limit, offset: offset);
      return right(PartsMarketMapper.toEntityList(parts));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(ServerFailure(statusCode: '401', message: 'Требуется авторизация'));
      }
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }
}
