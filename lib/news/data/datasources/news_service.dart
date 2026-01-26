import 'package:aviapoint/blog/data/models/upload_image_response_dto.dart';
import 'package:aviapoint/news/data/models/category_news_dto.dart';
import 'package:aviapoint/news/data/models/news_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio) = _NewsService;

  @GET('/api/news')
  Future<List<NewsDto>> getNews({
    @Query('published') bool? published,
    @Query('author_id') int? authorId,
  });

  @GET('/api/news/{id}')
  Future<NewsDto> getNewsById(@Path('id') int id);

  @GET('/api/category_news')
  Future<List<CategoryNewsDto>> getCategoryNews();

  @GET('/api/news/category/{categoryId}')
  Future<List<NewsDto>> getNewsByCategory(
    @Path('categoryId') int categoryId, {
    @Query('published') bool? published,
    @Query('author_id') int? authorId,
  });

  @POST('/api/news')
  @MultiPart()
  Future<NewsDto> createNewsWithMultipart(
    @Part(name: 'title') String title,
    @Part(name: 'sub_title') String subTitle,
    @Part(name: 'source') String source,
    @Part(name: 'body') String body,
    @Part(name: 'is_big_news') String isBigNews,
    @Part(name: 'category_id') String categoryId,
    @Part(name: 'picture_big') MultipartFile? pictureBig,
  );

  @POST('/api/news')
  Future<NewsDto> createNews(@Body() Map<String, dynamic> body);

  // Загрузка изображений для новостей
  @POST('/api/news/images/upload')
  @MultiPart()
  Future<UploadImageResponseDto> uploadNewsImage(@Part(name: 'image') MultipartFile image);

  // Обновление новости
  @PUT('/api/news/{id}')
  Future<NewsDto> updateNews(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/news/{id}')
  Future<void> deleteNews(@Path('id') int id);
}
