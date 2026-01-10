import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/blog/data/datasources/blog_service.dart';
import 'package:aviapoint/blog/data/models/blog_article_dto.dart';
import 'package:aviapoint/blog/data/models/create_blog_article_dto.dart';
import 'package:aviapoint/blog/data/repositories/mappers/blog_article_mapper.dart';
import 'package:aviapoint/blog/data/repositories/mappers/blog_category_mapper.dart';
import 'package:aviapoint/blog/data/repositories/mappers/blog_tag_mapper.dart';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_tag_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class BlogRepositoryImpl extends BlogRepository {
  final BlogService _blogService;
  final Dio _dio;

  BlogRepositoryImpl({required BlogService blogService})
      : _blogService = blogService,
        _dio = (getIt<ApiDatasource>() as ApiDatasourceDio).dio;

  @override
  Future<Either<Failure, List<BlogCategoryEntity>>> getCategories() async {
    try {
      final response = await _blogService.getCategories();
      return right(BlogCategoryMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, BlogCategoryEntity>> getCategoryById(int id) async {
    try {
      final response = await _blogService.getCategoryById(id);
      return right(BlogCategoryMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<BlogArticleEntity>>> getArticles({
    int? categoryId,
    int? tagId,
    int? authorId,
    bool? featured,
    String? status,
    int? limit,
    int? offset,
    String? search,
    int? aircraftModelId,
  }) async {
    try {
      final response = await _blogService.getArticles(
        categoryId: categoryId,
        tagId: tagId,
        authorId: authorId,
        featured: featured,
        status: status,
        limit: limit,
        offset: offset,
        search: search,
        aircraftModelId: aircraftModelId,
      );
      return right(BlogArticleMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, BlogArticleEntity>> getArticleById(int id) async {
    try {
      final response = await _blogService.getArticleById(id);
      return right(BlogArticleMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }


  @override
  Future<Either<Failure, List<BlogTagEntity>>> getTags() async {
    try {
      final response = await _blogService.getTags();
      return right(BlogTagMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<BlogArticleEntity>>> getArticlesByTag(int tagId) async {
    try {
      final response = await _blogService.getArticlesByTag(tagId);
      return right(BlogArticleMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, BlogArticleEntity>> createArticle({
    int? categoryId,
    int? aircraftModelId,
    required String title,
    String? excerpt,
    required String content,
    String? coverImageUrl,
    File? coverImageFile,
    Uint8List? coverImageBytes,
    String? coverImageFileName,
    String? status,
    List<int>? tagIds,
  }) async {
    try {
      BlogArticleDto response;

      // Если есть файл изображения или bytes, отправляем через FormData
      if (coverImageFile != null || coverImageBytes != null) {
        final formData = FormData();
        
        // Добавляем текстовые поля
        formData.fields.addAll([
          MapEntry('title', title),
          MapEntry('content', content),
        ]);
        
        if (categoryId != null) {
          formData.fields.add(MapEntry('category_id', categoryId.toString()));
        }
        if (aircraftModelId != null && aircraftModelId > 0) {
          formData.fields.add(MapEntry('aircraft_model_id', aircraftModelId.toString()));
        }
        if (excerpt != null && excerpt.isNotEmpty) {
          formData.fields.add(MapEntry('excerpt', excerpt));
        }
        if (status != null) {
          formData.fields.add(MapEntry('status', status));
        }
        if (tagIds != null && tagIds.isNotEmpty) {
          for (final tagId in tagIds) {
            formData.fields.add(MapEntry('tag_ids[]', tagId.toString()));
          }
        }

        // Добавляем файл изображения
        MultipartFile multipartFile;
        if (coverImageBytes != null) {
          // Используем bytes напрямую (для веб-версии)
          final fileName = coverImageFileName ?? 'cover_image.jpg';
          multipartFile = MultipartFile.fromBytes(coverImageBytes, filename: fileName);
        } else if (kIsWeb && coverImageFile != null) {
          // Для веб нужно конвертировать File в bytes
          final bytes = await coverImageFile!.readAsBytes();
          final fileName = coverImageFile!.path.split('/').last;
          multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
        } else if (coverImageFile != null) {
          multipartFile = await MultipartFile.fromFile(coverImageFile!.path, filename: coverImageFile!.path.split('/').last);
        } else {
          throw Exception('coverImageFile or coverImageBytes must be provided');
        }
        formData.files.add(MapEntry('cover_image', multipartFile));

        // Отправляем через Dio напрямую
        try {
          final dioResponse = await _dio.post<Map<String, dynamic>>(
            '/api/blog/articles',
            data: formData,
            options: Options(
              contentType: 'multipart/form-data',
              responseType: ResponseType.json,
              sendTimeout: const Duration(minutes: 2), // Увеличенный таймаут для загрузки файлов
              receiveTimeout: const Duration(minutes: 2),
              validateStatus: (status) => status! < 500, // Принимаем ответы до 500
            ),
          );
          
          if (dioResponse.statusCode != null && dioResponse.statusCode! >= 400) {
            // Обрабатываем ошибку
            String? errorMessage;
            if (dioResponse.data != null) {
              if (dioResponse.data is Map) {
                final data = dioResponse.data as Map;
                errorMessage = data['error']?.toString() ?? data.toString();
              } else {
                errorMessage = dioResponse.data.toString();
              }
            }
            return left(ServerFailure(
              statusCode: dioResponse.statusCode.toString(),
              message: errorMessage ?? 'Ошибка при создании статьи',
              responseMessage: errorMessage,
            ));
          }
          
          response = BlogArticleDto.fromJson(dioResponse.data!);
        } on FormatException {
          // Обрабатываем ошибку декодирования UTF-8
          return left(ServerFailure(
            statusCode: '400',
            message: 'Ошибка декодирования ответа сервера',
            responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
          ));
        }
      } else {
        // Если нет файла, отправляем JSON как обычно
        final dto = CreateBlogArticleDto(
          categoryId: categoryId,
          aircraftModelId: (aircraftModelId != null && aircraftModelId > 0) ? aircraftModelId : null,
          title: title,
          excerpt: excerpt,
          content: content,
          coverImageUrl: coverImageUrl,
          status: status,
          tagIds: tagIds,
        );

        final body = dto.toJson();
        // Удаляем null значения
        body.removeWhere((key, value) => value == null);

        response = await _blogService.createArticle(body);
      }

      return right(BlogArticleMapper.toEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(
        statusCode: e.response?.statusCode.toString(),
        message: e.message,
        responseMessage: responseMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, BlogArticleEntity>> updateArticle({
    required int id,
    int? categoryId,
    int? aircraftModelId,
    String? title,
    String? excerpt,
    String? content,
    String? coverImageUrl,
    File? coverImageFile,
    Uint8List? coverImageBytes,
    String? coverImageFileName,
    String? status,
    List<int>? tagIds,
  }) async {
    try {
      BlogArticleDto response;

      // Если есть файл изображения или bytes, отправляем через FormData
      if (coverImageFile != null || coverImageBytes != null) {
        final formData = FormData();
        
        // Добавляем текстовые поля
        if (title != null) {
          formData.fields.add(MapEntry('title', title));
        }
        if (content != null) {
          formData.fields.add(MapEntry('content', content));
        }
        if (categoryId != null) {
          formData.fields.add(MapEntry('category_id', categoryId.toString()));
        }
        if (aircraftModelId != null && aircraftModelId > 0) {
          formData.fields.add(MapEntry('aircraft_model_id', aircraftModelId.toString()));
        }
        if (excerpt != null && excerpt.isNotEmpty) {
          formData.fields.add(MapEntry('excerpt', excerpt));
        }
        if (status != null) {
          formData.fields.add(MapEntry('status', status));
        }
        if (tagIds != null && tagIds.isNotEmpty) {
          for (final tagId in tagIds) {
            formData.fields.add(MapEntry('tag_ids[]', tagId.toString()));
          }
        }

        // Добавляем файл изображения
        MultipartFile multipartFile;
        if (coverImageBytes != null) {
          // Используем bytes напрямую (для веб-версии)
          final fileName = coverImageFileName ?? 'cover_image.jpg';
          multipartFile = MultipartFile.fromBytes(coverImageBytes, filename: fileName);
        } else if (kIsWeb && coverImageFile != null) {
          // Для веб нужно конвертировать File в bytes
          final bytes = await coverImageFile!.readAsBytes();
          final fileName = coverImageFile!.path.split('/').last;
          multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
        } else if (coverImageFile != null) {
          multipartFile = await MultipartFile.fromFile(coverImageFile!.path, filename: coverImageFile!.path.split('/').last);
        } else {
          throw Exception('coverImageFile or coverImageBytes must be provided');
        }
        formData.files.add(MapEntry('cover_image', multipartFile));

        // Отправляем через Dio напрямую
        try {
          final dioResponse = await _dio.put<Map<String, dynamic>>(
            '/api/blog/articles/$id',
            data: formData,
            options: Options(
              contentType: 'multipart/form-data',
              responseType: ResponseType.json,
              sendTimeout: const Duration(minutes: 2), // Увеличенный таймаут для загрузки файлов
              receiveTimeout: const Duration(minutes: 2),
              validateStatus: (status) => status! < 500, // Принимаем ответы до 500
            ),
          );
          
          if (dioResponse.statusCode != null && dioResponse.statusCode! >= 400) {
            // Обрабатываем ошибку
            String? errorMessage;
            if (dioResponse.data != null) {
              if (dioResponse.data is Map) {
                final data = dioResponse.data as Map;
                errorMessage = data['error']?.toString() ?? data.toString();
              } else {
                errorMessage = dioResponse.data.toString();
              }
            }
            return left(ServerFailure(
              statusCode: dioResponse.statusCode.toString(),
              message: errorMessage ?? 'Ошибка при обновлении статьи',
              responseMessage: errorMessage,
            ));
          }
          
          response = BlogArticleDto.fromJson(dioResponse.data!);
        } on FormatException {
          // Обрабатываем ошибку декодирования UTF-8
          return left(ServerFailure(
            statusCode: '400',
            message: 'Ошибка декодирования ответа сервера',
            responseMessage: 'Сервер вернул невалидный ответ. Возможно, проблема с кодировкой данных.',
          ));
        }
      } else {
        // Если нет файла, отправляем JSON как обычно
        final body = <String, dynamic>{};
        if (categoryId != null) body['category_id'] = categoryId;
        if (aircraftModelId != null && aircraftModelId > 0) {
          body['aircraft_model_id'] = aircraftModelId;
        }
        if (title != null) body['title'] = title;
        if (excerpt != null) body['excerpt'] = excerpt;
        if (content != null) body['content'] = content;
        if (coverImageUrl != null) body['cover_image_url'] = coverImageUrl;
        if (status != null) body['status'] = status;
        if (tagIds != null) body['tag_ids'] = tagIds;

        response = await _blogService.updateArticle(id, body);
      }

      return right(BlogArticleMapper.toEntity(response));
    } on DioException catch (e) {
      String? responseMessage;
      if (e.response?.data != null) {
        if (e.response!.data is Map) {
          responseMessage = e.response!.data['error']?.toString() ?? e.response!.data.toString();
        } else {
          responseMessage = e.response!.data.toString();
        }
      }
      return left(ServerFailure(
        statusCode: e.response?.statusCode.toString(),
        message: e.message,
        responseMessage: responseMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> deleteArticle(int id) async {
    try {
      await _blogService.deleteArticle(id);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> uploadContentImage(File imageFile, {int? articleId}) async {
    try {
      MultipartFile multipartFile;
      if (kIsWeb) {
        final bytes = await imageFile.readAsBytes();
        final fileName = imageFile.path.split('/').last;
        multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
      } else {
        multipartFile = await MultipartFile.fromFile(imageFile.path, filename: imageFile.path.split('/').last);
      }

      final response = articleId != null
          ? await _blogService.uploadContentImage(articleId, multipartFile)
          : await _blogService.uploadContentImageTemporary(multipartFile);
      
      if (response.url.isEmpty) {
        return left(ServerFailure(
          statusCode: null,
          message: 'Не удалось получить URL загруженного изображения',
        ));
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
      return left(ServerFailure(
        statusCode: e.response?.statusCode.toString(),
        message: e.message,
        responseMessage: responseMessage,
      ));
    } catch (e) {
      return left(ServerFailure(
        statusCode: null,
        message: 'Ошибка при загрузке изображения: ${e.toString()}',
      ));
    }
  }

  @override
  Future<Either<Failure, String>> uploadContentImageBytes(List<int> bytes, {required String fileName, int? articleId}) async {
    try {
      final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);

      final response = articleId != null
          ? await _blogService.uploadContentImage(articleId, multipartFile)
          : await _blogService.uploadContentImageTemporary(multipartFile);
      
      if (response.url.isEmpty) {
        return left(ServerFailure(
          statusCode: null,
          message: 'Не удалось получить URL загруженного изображения',
        ));
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
      return left(ServerFailure(
        statusCode: e.response?.statusCode.toString(),
        message: e.message,
        responseMessage: responseMessage,
      ));
    } catch (e) {
      return left(ServerFailure(
        statusCode: null,
        message: 'Ошибка при загрузке изображения: ${e.toString()}',
      ));
    }
  }

}
