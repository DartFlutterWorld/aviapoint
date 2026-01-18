// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SmsDto _$SmsDtoFromJson(Map<String, dynamic> json) => _SmsDto(errCode: json['err_code'], text: json['text'] as String);

Map<String, dynamic> _$SmsDtoToJson(_SmsDto instance) => <String, dynamic>{
  'err_code': instance.errCode,
  'text': instance.text,
};
