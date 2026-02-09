import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<CategoryNewsEntity>>> getCategoryNews();

  Future<Either<Failure, List<NewsEntity>>> getNews({bool? published, int? authorId});

  Future<Either<Failure, NewsEntity>> getNewsById({required int id});

  Future<Either<Failure, List<NewsEntity>>> getNewsByCategory({
    required int categoryId,
    bool? published,
    int? authorId,
  });

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
  });

  Future<Either<Failure, String>> uploadNewsImage(File imageFile);
  Future<Either<Failure, String>> uploadNewsImageBytes(List<int> bytes, {required String fileName});

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
  });

  Future<Either<Failure, void>> deleteNews(int id);
}
