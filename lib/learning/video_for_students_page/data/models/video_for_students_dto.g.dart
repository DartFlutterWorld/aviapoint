// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_for_students_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoForStudentsDtoImpl _$$VideoForStudentsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$VideoForStudentsDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      fileName: json['fileName'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$VideoForStudentsDtoImplToJson(
        _$VideoForStudentsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fileName': instance.fileName,
      'url': instance.url,
    };
