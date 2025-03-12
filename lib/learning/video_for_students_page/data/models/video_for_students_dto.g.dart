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
      fileName: json['file_name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$VideoForStudentsDtoImplToJson(
        _$VideoForStudentsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file_name': instance.fileName,
      'url': instance.url,
    };
