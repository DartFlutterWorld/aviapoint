import 'package:aviapoint/news/data/models/category_news_dto.dart';
import 'package:aviapoint/news/data/models/news_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('/api/news')
  Future<List<NewsDto>> getNews();

  @GET('/api/news/{id}')
  Future<NewsDto> getNewsById(@Path('id') int id);

  @GET('/api/category_news')
  Future<List<CategoryNewsDto>> getCategoryNews();

  @GET('/api/news/category/{categoryId}')
  Future<List<NewsDto>> getNewsByCategory(@Path('categoryId') int categoryId);
}
