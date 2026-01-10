import 'dart:convert';
import 'dart:io';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/models/airport_dto.dart';
import 'package:aviapoint/on_the_way/data/models/airport_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AirportService {
  final OnTheWayService _onTheWayService;

  AirportService(Dio dio) : _onTheWayService = OnTheWayService(dio);

  /// Поиск аэропортов через API
  Future<List<AirportModel>> searchAirports(String query) async {
    try {
      print('🔍 [AirportService] Поиск аэропортов: "$query"');
      // Если запрос пустой, возвращаем пустой список
      if (query.isEmpty) {
        return [];
      }

      // Ищем через API (без ограничения по стране для использования обновленной базы)
      print('📡 [AirportService] Запрос к API...');
      final airports = await _onTheWayService.searchAirports(
        query: query,
        // Убрали ограничение country: 'RU' для использования обновленной базы
        limit: 50,
      );

      print('✅ [AirportService] Получено ${airports.length} аэропортов из API');

      // Преобразуем DTO в Model с обработкой ошибок для каждого элемента
      final results = <AirportModel>[];
      for (final dto in airports) {
        try {
          results.add(_dtoToModel(dto));
        } catch (e, stackTrace) {
          print('⚠️ [AirportService] Ошибка парсинга аэропорта ${dto.ident}: $e');
          print('⚠️ [AirportService] Stack trace: $stackTrace');
          // Пропускаем некорректный элемент и продолжаем обработку остальных
        }
      }

      print('✅ [AirportService] Успешно обработано ${results.length} аэропортов');

      // Сортируем: сначала действующие, потом недействующие, внутри каждой группы по названию
      results.sort((a, b) {
        // Сначала сравниваем по статусу (действующие первыми)
        if (a.isActive != b.isActive) {
          // Если a действующий, а b нет - a идет первым (отрицательное значение)
          // Если a недействующий, а b действующий - b идет первым (положительное значение)
          return a.isActive ? -1 : 1;
        }
        // Если статус одинаковый, сортируем по названию
        return a.name.compareTo(b.name);
      });

      return results;
    } catch (e, stackTrace) {
      print('❌ [AirportService] Ошибка поиска аэропортов: $e');
      print('❌ [AirportService] Тип ошибки: ${e.runtimeType}');
      if (e is DioException) {
        print('❌ [AirportService] DioException: statusCode=${e.response?.statusCode}, message=${e.message}');
        print('❌ [AirportService] Response data: ${e.response?.data}');
      }
      print('❌ [AirportService] Stack trace: $stackTrace');
      // В случае ошибки возвращаем пустой список
      return [];
    }
  }

  /// Преобразует AirportDto в AirportModel
  AirportModel _dtoToModel(AirportDto dto) {
    // Определяем страну по country_code или country
    String? country;
    final countryCode = dto.countryCode ?? '';
    if (countryCode == 'RU' || countryCode == 'UU' || dto.country == 'Россия') {
      country = 'Россия';
    } else if (countryCode == 'KZ' || dto.country == 'Казахстан') {
      country = 'Казахстан';
    } else if (countryCode == 'UA' || dto.country == 'Украина') {
      country = 'Украина';
    } else if (countryCode == 'FR' || dto.country == 'Франция') {
      country = 'Франция';
    } else if (countryCode == 'GB' || dto.country == 'Великобритания') {
      country = 'Великобритания';
    } else if (countryCode == 'DE' || dto.country == 'Германия') {
      country = 'Германия';
    } else if (countryCode == 'US' || dto.country == 'США') {
      country = 'США';
    } else if (dto.country != null && dto.country!.isNotEmpty) {
      country = dto.country;
    }

    return AirportModel(
      id: dto.id,
      code: dto.ident,
      identRu: dto.identRu,
      type: dto.type,
      name: dto.name,
      nameEng: dto.nameEng,
      city: dto.city ?? dto.municipality,
      country: country,
      countryCode: dto.countryCode,
      countryEng: dto.countryEng,
      region: dto.region ?? dto.isoRegion,
      regionEng: dto.regionEng,
      coordinatesText: dto.coordinatesText,
      continent: dto.continent,
      latitudeDeg: dto.latitudeDeg,
      longitudeDeg: dto.longitudeDeg,
      elevationFt: dto.elevationFt,
      ownership: dto.ownership,
      isInternational: dto.isInternational || (dto.scheduledService == 'yes'),
      email: dto.email,
      website: dto.website,
      notes: dto.notes,
      runwayName: dto.runwayName,
      runwayLength: dto.runwayLength,
      runwayWidth: dto.runwayWidth,
      runwaySurface: dto.runwaySurface,
      runwayMagneticCourse: dto.runwayMagneticCourse,
      runwayLighting: dto.runwayLighting,
      gpsCode: dto.gpsCode,
      iataCode: dto.iataCode,
      localCode: dto.localCode,
      services: dto.services,
      ownerId: dto.ownerId,
      isVerified: dto.isVerified,
      photos: _parsePhotos(dto.photos),
      visitorPhotos: _parsePhotos(dto.visitorPhotos),
      isActive: dto.isActive,
      source: dto.source,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Парсинг фотографий из JSONB
  List<String>? _parsePhotos(dynamic photos) {
    if (photos == null) {
      print('📸 [AirportService] _parsePhotos: photos is null');
      return null;
    }
    if (photos is List) {
      final result = photos.map((e) => e.toString()).toList();
      print('📸 [AirportService] _parsePhotos: parsed List with ${result.length} items');
      return result;
    }
    if (photos is String) {
      try {
        final decoded = jsonDecode(photos);
        if (decoded is List) {
          final result = decoded.map((e) => e.toString()).toList();
          print('📸 [AirportService] _parsePhotos: parsed String to List with ${result.length} items');
          return result;
        }
      } catch (e) {
        print('⚠️ [AirportService] _parsePhotos: ошибка парсинга String: $e');
        // Игнорируем ошибки парсинга
      }
    }
    print('⚠️ [AirportService] _parsePhotos: неизвестный тип ${photos.runtimeType}');
    return null;
  }

  /// Получить аэропорт по коду
  Future<AirportModel?> getAirportByCode(String code) async {
    try {
      print('🔍 [AirportService] Получение аэропорта по коду: "$code"');
      final dto = await _onTheWayService.getAirportByCode(code);
      print('✅ [AirportService] Получен аэропорт: ${dto.ident}');
      return _dtoToModel(dto);
    } catch (e, stackTrace) {
      print('❌ [AirportService] Ошибка получения аэропорта по коду "$code": $e');
      print('❌ [AirportService] Тип ошибки: ${e.runtimeType}');
      if (e is DioException) {
        print('❌ [AirportService] DioException: statusCode=${e.response?.statusCode}, message=${e.message}');
        print('❌ [AirportService] Response data: ${e.response?.data}');
      }
      print('❌ [AirportService] Stack trace: $stackTrace');
      return null;
    }
  }

  /// Загрузить официальные фотографии аэропорта (только для владельцев)
  Future<AirportModel> uploadAirportPhotos({required String airportCode, required List<XFile> photos}) async {
    try {
      // Конвертируем XFile в MultipartFile
      final multipartFiles = await Future.wait(
        photos.map((photo) async {
          if (kIsWeb) {
            final bytes = await photo.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: photo.name);
          } else {
            final file = File(photo.path);
            return await MultipartFile.fromFile(file.path, filename: photo.name);
          }
        }),
      );

      final dto = await _onTheWayService.uploadAirportPhotos(airportCode, multipartFiles);
      return _dtoToModel(dto);
    } catch (e, stackTrace) {
      print('❌ [AirportService] Ошибка загрузки официальных фото: $e');
      print('❌ [AirportService] Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Загрузить фотографии посетителей
  Future<AirportModel> uploadVisitorPhotos({required String airportCode, required List<XFile> photos}) async {
    try {
      // Конвертируем XFile в MultipartFile
      final multipartFiles = await Future.wait(
        photos.map((photo) async {
          if (kIsWeb) {
            final bytes = await photo.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: photo.name);
          } else {
            final file = File(photo.path);
            return await MultipartFile.fromFile(file.path, filename: photo.name);
          }
        }),
      );

      final dto = await _onTheWayService.uploadVisitorPhotos(airportCode, multipartFiles);
      return _dtoToModel(dto);
    } catch (e, stackTrace) {
      print('❌ [AirportService] Ошибка загрузки фото посетителей: $e');
      print('❌ [AirportService] Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Удалить фотографию посетителя
  Future<AirportModel> deleteVisitorPhoto({required String airportCode, required String photoUrl}) async {
    try {
      final dto = await _onTheWayService.deleteVisitorPhoto(airportCode, {'photo_url': photoUrl});
      return _dtoToModel(dto);
    } catch (e, stackTrace) {
      print('❌ [AirportService] Ошибка удаления фото посетителя: $e');
      print('❌ [AirportService] Stack trace: $stackTrace');
      rethrow;
    }
  }
}
