// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => NewsDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subTitle: json['sub_title'] as String,
      source: json['source'] as String,
      date: json['date'] as String,
      body: json['body'] as String,
      pictureMini: json['picture_mini'] as String,
      pictureBig: json['picture_big'] as String,
      isBigNews: json['is_big_news'] as bool,
      categoryId: (json['category_id'] as num).toInt(),
    );
