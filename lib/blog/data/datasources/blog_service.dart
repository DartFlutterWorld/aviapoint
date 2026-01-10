import 'package:aviapoint/blog/data/models/blog_article_dto.dart';
import 'package:aviapoint/blog/data/models/blog_category_dto.dart';
import 'package:aviapoint/blog/data/models/blog_tag_dto.dart';
import 'package:aviapoint/blog/data/models/upload_image_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'blog_service.g.dart';

@RestApi()
abstract class BlogService {
  factory BlogService(Dio dio) = _BlogService;

  // Категории
  @GET('/api/blog/categories')
  Future<List<BlogCategoryDto>> getCategories();

  @GET('/api/blog/categories/{id}')
  Future<BlogCategoryDto> getCategoryById(@Path('id') int id);

  // Статьи
  @GET('/api/blog/articles')
  Future<List<BlogArticleDto>> getArticles({
    @Query('category_id') int? categoryId,
    @Query('tag_id') int? tagId,
    @Query('author_id') int? authorId,
    @Query('featured') bool? featured,
    @Query('status') String? status,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('search') String? search,
    @Query('aircraft_model_id') int? aircraftModelId,
  });

  @GET('/api/blog/articles/{id}')
  Future<BlogArticleDto> getArticleById(@Path('id') int id);

  // Теги
  @GET('/api/blog/tags')
  Future<List<BlogTagDto>> getTags();

  @GET('/api/blog/tags/{id}/articles')
  Future<List<BlogArticleDto>> getArticlesByTag(@Path('id') int tagId);

  // Создание и редактирование статей
  @POST('/api/blog/articles')
  Future<BlogArticleDto> createArticle(@Body() Map<String, dynamic> body);

  @PUT('/api/blog/articles/{id}')
  Future<BlogArticleDto> updateArticle(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/api/blog/articles/{id}')
  Future<void> deleteArticle(@Path('id') int id);

  // Загрузка изображений для контента статьи
  @POST('/api/blog/articles/{id}/content-images')
  @MultiPart()
  Future<UploadImageResponseDto> uploadContentImage(@Path('id') int articleId, @Part(name: 'image') MultipartFile image);

  // Загрузка изображений для контента новой статьи (без article_id)
  @POST('/api/blog/articles/content-images/upload')
  @MultiPart()
  Future<UploadImageResponseDto> uploadContentImageTemporary(@Part(name: 'image') MultipartFile image);
}
