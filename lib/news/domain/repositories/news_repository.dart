import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<CategoryNewsEntity>>> getCategoryNews();

  Future<Either<Failure, List<NewsEntity>>> getNews();

  Future<Either<Failure, NewsEntity>> getNewsById({required int id});

  Future<Either<Failure, List<NewsEntity>>> getNewsByCategory({required int categoryId});
}
