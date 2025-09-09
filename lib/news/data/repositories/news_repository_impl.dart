import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/main_page/stories/domain/repositories/story_repository.dart';
import 'package:aviapoint/news/data/datasources/news_service.dart';
import 'package:aviapoint/news/data/repositories/mappers/category_news_mapper.dart';
import 'package:aviapoint/news/data/repositories/mappers/news_mapper.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsService _newsService;

  NewsRepositoryImpl({required NewsService newsService}) : _newsService = newsService;

  @override
  Future<Either<Failure, List<CategoryNewsEntity>>> getCategoryNews() async {
    try {
      final response = await _newsService.getCategoryNews();

      return right(
        CategoryNewsMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    try {
      final response = await _newsService.getNews();

      return right(
        NewsMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getNewsById({required int id}) async {
    try {
      final response = await _newsService.getNewsById(id);

      return right(
        NewsMapper.toEntity(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getNewsByCategory({required int categoryId}) async {
    try {
      final response = await _newsService.getNewsByCategory(categoryId);

      return right(
        NewsMapper.toEntities(response),
      );
    } on DioException catch (e) {
      return left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString(),
          message: e.message,
        ),
      );
    }
  }
}
