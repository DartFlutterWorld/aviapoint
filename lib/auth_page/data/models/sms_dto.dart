import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_dto.freezed.dart';
part 'sms_dto.g.dart';

@freezed
abstract class SmsDto with _$SmsDto {
  const factory SmsDto({@JsonKey(name: 'err_code') errCode, required String text}) = _SmsDto;

  factory SmsDto.fromJson(Map<String, dynamic> json) => _$SmsDtoFromJson(json);
}
