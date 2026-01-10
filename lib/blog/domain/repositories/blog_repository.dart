import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/blog/domain/entities/blog_article_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_category_entity.dart';
import 'package:aviapoint/blog/domain/entities/blog_tag_entity.dart';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRepository {
  // Категории
  Future<Either<Failure, List<BlogCategoryEntity>>> getCategories();
  Future<Either<Failure, BlogCategoryEntity>> getCategoryById(int id);

  // Статьи
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
  });

  Future<Either<Failure, BlogArticleEntity>> getArticleById(int id);

  // Теги
  Future<Either<Failure, List<BlogTagEntity>>> getTags();
  Future<Either<Failure, List<BlogArticleEntity>>> getArticlesByTag(int tagId);

  // Создание и редактирование статей
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
  });

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
  });

  Future<Either<Failure, void>> deleteArticle(int id);

  // Загрузка изображений для контента статьи
  // Если articleId указан, изображение сохраняется в папку статьи
  // Если articleId null, изображение сохраняется во временную папку (для новых статей)
  Future<Either<Failure, String>> uploadContentImage(File imageFile, {int? articleId});
  
  // Загрузка изображений для контента статьи из bytes (для веб-версии)
  Future<Either<Failure, String>> uploadContentImageBytes(List<int> bytes, {required String fileName, int? articleId});
}
