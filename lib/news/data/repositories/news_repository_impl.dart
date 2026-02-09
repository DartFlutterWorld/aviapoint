import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/news/data/datasources/news_service.dart';
import 'package:aviapoint/news/data/models/news_dto.dart';
import 'package:aviapoint/news/data/repositories/mappers/category_news_mapper.dart';
import 'package:aviapoint/news/data/repositories/mappers/news_mapper.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsService _newsService;
  final Dio _dio;

  NewsRepositoryImpl({required NewsService newsService})
    : _newsService = newsService,
      _dio = (getIt<ApiDatasource>() as ApiDatasourceDio).dio;

  @override
  Future<Either<Failure, List<CategoryNewsEntity>>> getCategoryNews() async {
    try {
      final response = await _newsService.getCategoryNews();

      return right(CategoryNewsMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews({bool? published, int? authorId}) async {
    try {
      final response = await _newsService.getNews(published: published, authorId: authorId);

      return right(NewsMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getNewsById({required int id}) async {
    try {
      final response = await _newsService.getNewsById(id);

      return right(NewsMapper.toEntity(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsByCategory({
    required int categoryId,
    bool? published,
    int? authorId,
  }) async {
    try {
      final response = await _newsService.getNewsByCategory(categoryId, published: published, authorId: authorId);

      return right(NewsMapper.toEntities(response));
    } on DioException catch (e) {
      return left(ServerFailure(statusCode: e.response?.statusCode.toString(), message: e.message));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> createNews({
    required String title,
    required String subTitle,
    required String source,
    required String body,
    String? content, // Quill Delta JSON
    String? pictureMini,
    String? pictureBig,
    File? pictureMiniFile,
    File? pictureBigFile,
    Uint8List? pictureMiniBytes,
    Uint8List? pictureBigBytes,
    String? pictureMiniFileName,
    String? pictureBigFileName,
    List<File>? additionalImageFiles,
    List<Uint8List>? additionalImageBytes,
    List<String>? additionalImageFileNames,
    required bool isBigNews,
    required int categoryId,
  }) async {
    try {
      // Проверяем наличие большого изображения
      if (pictureBig == null && pictureBigFile == null && pictureBigBytes == null) {
        return left(ServerFailure(statusCode: '400', message: 'Необходимо предоставить изображение для обложки'));
      }

      // Если есть файл изображения или bytes, отправляем через multipart/form-data
      if (pictureBigFile != null || pictureBigBytes != null) {
        final formData = FormData();

        // Добавляем текстовые поля
        formData.fields.addAll([
          MapEntry('title', title),
          MapEntry('sub_title', subTitle),
          MapEntry('source', source),
          MapEntry('body', body),
          if (content != null) MapEntry('content', content),
          MapEntry('is_big_news', isBigNews.toString()),
          MapEntry('category_id', categoryId.toString()),
        ]);

        // Добавляем дополнительные изображения
        if (additionalImageFiles != null && additionalImageFiles.isNotEmpty) {
          for (int i = 0; i < additionalImageFiles.length; i++) {
            final file = additionalImageFiles[i];
            MultipartFile multipartFile;
            if (kIsWeb) {
              final bytes = await file.readAsBytes();
              final fileName = file.path.split('/').last;
              multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
            } else {
              multipartFile = await MultipartFile.fromFile(file.path, filename: file.path.split('/').last);
            }
            formData.files.add(MapEntry('additional_images[]', multipartFile));
          }
        } else if (additionalImageBytes != null && additionalImageBytes.isNotEmpty) {
          for (int i = 0; i < additionalImageBytes.length; i++) {
            final bytes = additionalImageBytes[i];
            final fileName = additionalImageFileNames != null && i < additionalImageFileNames.length
                ? additionalImageFileNames[i]
                : 'additional_image_$i.jpg';
            final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
            formData.files.add(MapEntry('additional_images[]', multipartFile));
          }
        }

        // Добавляем файл изображения
        MultipartFile multipartFile;
        if (pictureBigBytes != null) {
          // Используем bytes напрямую (для веб-версии)
          final fileName = pictureBigFileName ?? 'picture_big.jpg';
          multipartFile = MultipartFile.fromBytes(pictureBigBytes, filename: fileName);
        } else if (kIsWeb && pictureBigFile != null) {
          // Для веб нужно конвертировать File в bytes
          final bytes = await pictureBigFile.readAsBytes();
          final fileName = pictureBigFile.path.split('/').last;
          multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
        } else if (pictureBigFile != null) {
          // Для других платформ используем File напрямую
          multipartFile = await MultipartFile.fromFile(
            pictureBigFile.path,
            filename: pictureBigFile.path.split('/').last,
          );
        } else {
          return left(ServerFailure(statusCode: '400', message: 'Не удалось подготовить файл изображения'));
        }

        formData.files.add(MapEntry('picture_big', multipartFile));

        // Отправляем через Dio напрямую (так как Retrofit может не поддерживать все случаи multipart)
        try {
          final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
          final dio = apiDatasource.dio;

          final response = await dio.post<Map<String, dynamic>>(
            '/api/news',
            data: formData,
            options: Options(contentType: 'multipart/form-data'),
          );

          if (response.data == null) {
            return left(ServerFailure(statusCode: response.statusCode?.toString(), message: 'Пустой ответ от сервера'));
          }

          final newsDto = NewsDto.fromJson(response.data!);
          return right(NewsMapper.toEntity(newsDto));
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
        }
      } else {
        // Если изображение передано как URL, отправляем через JSON
        final requestBody = {
          'title': title,
          'sub_title': subTitle,
          'source': source,
          'body': body,
          if (content != null) 'content': content,
          'picture_mini': pictureBig, // Используем большое изображение и для миниатюры
          'picture_big': pictureBig,
          'is_big_news': isBigNews,
          'category_id': categoryId,
          'published': false, // Новости, предложенные пользователями, сохраняются с published = false
        };

        final response = await _newsService.createNews(requestBody);

        return right(NewsMapper.toEntity(response));
      }
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
      return left(ServerFailure(statusCode: '500', message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadNewsImage(File imageFile) async {
    try {
      MultipartFile multipartFile;
      if (kIsWeb) {
        final bytes = await imageFile.readAsBytes();
        final fileName = imageFile.path.split('/').last;
        multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
      } else {
        multipartFile = await MultipartFile.fromFile(imageFile.path, filename: imageFile.path.split('/').last);
      }

      final response = await _newsService.uploadNewsImage(multipartFile);

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
  Future<Either<Failure, String>> uploadNewsImageBytes(List<int> bytes, {required String fileName}) async {
    try {
      final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);

      final response = await _newsService.uploadNewsImage(multipartFile);

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
  Future<Either<Failure, NewsEntity>> updateNews({
    required int id,
    String? title,
    String? subTitle,
    String? source,
    String? body,
    String? content,
    String? pictureMini,
    String? pictureBig,
    File? pictureMiniFile,
    File? pictureBigFile,
    Uint8List? pictureMiniBytes,
    Uint8List? pictureBigBytes,
    String? pictureMiniFileName,
    String? pictureBigFileName,
    List<File>? additionalImageFiles,
    List<Uint8List>? additionalImageBytes,
    List<String>? additionalImageFileNames,
    bool? deletePictureBig,
    List<String>? imagesToDelete,
    bool? isBigNews,
    int? categoryId,
    bool? published,
  }) async {
    try {
      // Если есть файл изображения, отправляем через FormData
      if (pictureBigFile != null || pictureBigBytes != null) {
        final formData = FormData();

        // Добавляем текстовые поля
        if (title != null) formData.fields.add(MapEntry('title', title));
        if (subTitle != null) formData.fields.add(MapEntry('sub_title', subTitle));
        if (source != null) formData.fields.add(MapEntry('source', source));
        if (body != null) formData.fields.add(MapEntry('body', body));
        if (content != null) formData.fields.add(MapEntry('content', content));
        if (isBigNews != null) formData.fields.add(MapEntry('is_big_news', isBigNews.toString()));
        if (categoryId != null) formData.fields.add(MapEntry('category_id', categoryId.toString()));
        if (published != null) formData.fields.add(MapEntry('published', published.toString()));
        if (deletePictureBig == true) formData.fields.add(MapEntry('delete_picture_big', 'true'));
        if (imagesToDelete != null && imagesToDelete.isNotEmpty) {
          for (final url in imagesToDelete) {
            formData.fields.add(MapEntry('images_to_delete[]', url));
          }
        }

        // Добавляем файл изображения
        MultipartFile multipartFile;
        if (pictureBigBytes != null) {
          final fileName = pictureBigFileName ?? 'picture_big.jpg';
          multipartFile = MultipartFile.fromBytes(pictureBigBytes, filename: fileName);
        } else if (kIsWeb && pictureBigFile != null) {
          final bytes = await pictureBigFile.readAsBytes();
          final fileName = pictureBigFile.path.split('/').last;
          multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
        } else if (pictureBigFile != null) {
          multipartFile = await MultipartFile.fromFile(
            pictureBigFile.path,
            filename: pictureBigFile.path.split('/').last,
          );
        } else {
          return left(ServerFailure(statusCode: '400', message: 'Не удалось подготовить файл изображения'));
        }
        formData.files.add(MapEntry('picture_big', multipartFile));

        // Добавляем дополнительные изображения
        if (additionalImageFiles != null && additionalImageFiles.isNotEmpty) {
          for (final file in additionalImageFiles) {
            if (kIsWeb) {
              final bytes = await file.readAsBytes();
              final fileName = file.path.split('/').last;
              formData.files.add(MapEntry('additional_images[]', MultipartFile.fromBytes(bytes, filename: fileName)));
            } else {
              formData.files.add(
                MapEntry(
                  'additional_images[]',
                  await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
                ),
              );
            }
          }
        } else if (additionalImageBytes != null && additionalImageBytes.isNotEmpty) {
          for (int i = 0; i < additionalImageBytes.length; i++) {
            final bytes = additionalImageBytes[i];
            final fileName = additionalImageFileNames?[i] ?? 'additional_image_$i.jpg';
            formData.files.add(MapEntry('additional_images[]', MultipartFile.fromBytes(bytes, filename: fileName)));
          }
        }

        final dioResponse = await _dio.put<Map<String, dynamic>>(
          '/api/news/$id',
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
              message: errorMessage ?? 'Ошибка при обновлении новости',
              responseMessage: errorMessage,
            ),
          );
        }

        return right(NewsMapper.toEntity(NewsDto.fromJson(dioResponse.data!)));
      } else {
        // Если нет файла, отправляем JSON
        final requestBody = <String, dynamic>{};
        if (title != null) requestBody['title'] = title;
        if (subTitle != null) requestBody['sub_title'] = subTitle;
        if (source != null) requestBody['source'] = source;
        if (body != null) requestBody['body'] = body;
        if (content != null) requestBody['content'] = content;
        if (pictureMini != null) requestBody['picture_mini'] = pictureMini;
        if (pictureBig != null) requestBody['picture_big'] = pictureBig;
        if (isBigNews != null) requestBody['is_big_news'] = isBigNews;
        if (categoryId != null) requestBody['category_id'] = categoryId;
        if (published != null) requestBody['published'] = published;
        if (deletePictureBig == true) requestBody['delete_picture_big'] = true;
        if (imagesToDelete != null && imagesToDelete.isNotEmpty) {
          requestBody['images_to_delete'] = imagesToDelete;
        }

        final response = await _newsService.updateNews(id, requestBody);
        return right(NewsMapper.toEntity(response));
      }
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
      return left(ServerFailure(statusCode: '500', message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNews(int id) async {
    try {
      await _newsService.deleteNews(id);
      return right(null);
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
      return left(ServerFailure(statusCode: '500', message: e.toString()));
    }
  }
}
