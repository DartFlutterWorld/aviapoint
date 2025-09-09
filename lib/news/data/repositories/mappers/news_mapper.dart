import 'package:aviapoint/news/data/models/news_dto.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';

class NewsMapper {
  static NewsEntity toEntity(NewsDto model) {
    return NewsEntity(
      id: model.id,
      title: model.title,
      subTitle: model.subTitle,
      source: model.source,
      date: model.date,
      body: model.body,
      pictureMini: model.pictureMini,
      pictureBig: model.pictureBig,
      isBigNews: model.isBigNews,
      categoryId: model.categoryId,
    );
  }

  static List<NewsEntity> toEntities(List<NewsDto> models) => models.map((model) => toEntity(model)).toList();
}
