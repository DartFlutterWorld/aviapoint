import 'package:aviapoint/news/data/models/category_news_dto.dart';
import 'package:aviapoint/news/data/models/news_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('/news')
  Future<List<NewsDto>> getNews();

  @GET('/news/{id}')
  Future<NewsDto> getNewsById(@Path('id') int id);

  @GET('/category_news')
  Future<List<CategoryNewsDto>> getCategoryNews();

  @GET('/news/category/{categoryId}')
  Future<List<NewsDto>> getNewsByCategory(@Path('categoryId') int categoryId);
}
