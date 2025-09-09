import 'package:aviapoint/news/data/models/category_news_dto.dart';
import 'package:aviapoint/news/domain/entities/category_news_entity.dart';

class CategoryNewsMapper {
  static CategoryNewsEntity toEntity(CategoryNewsDto model) {
    return CategoryNewsEntity(
      id: model.id,
      title: model.title,
    );
  }

  static List<CategoryNewsEntity> toEntities(List<CategoryNewsDto> models) => models.map((model) => toEntity(model)).toList();
}
