import 'package:aviapoint/auth_page/data/models/sms_dto.dart';
import 'package:aviapoint/auth_page/domain/entities/sms_entity.dart';

class SmsMapper {
  static SmsEntity toEntity(
    SmsDto model,
  ) {
    return SmsEntity(
      errCode: model.errCode,
      text: model.text,
    );
  }
}
