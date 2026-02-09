import 'package:json_annotation/json_annotation.dart';
import 'package:aviapoint/market/domain/entities/price_history_entity.dart';

part 'price_history_dto.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class PriceHistoryDto {
  final int id;
  @JsonKey(name: 'aircraft_market_id')
  final int aircraftMarketId;
  final int price;
  @JsonKey(name: 'created_at', fromJson: _dateTimeFromJson)
  final DateTime createdAt;

  PriceHistoryDto({required this.id, required this.aircraftMarketId, required this.price, required this.createdAt});

  factory PriceHistoryDto.fromJson(Map<String, dynamic> json) => _$PriceHistoryDtoFromJson(json);

  static DateTime _dateTimeFromJson(dynamic json) {
    if (json == null) throw FormatException('DateTime cannot be null');
    if (json is String) return DateTime.parse(json);
    if (json is DateTime) return json;
    throw FormatException('Invalid DateTime format: $json');
  }

  PriceHistoryEntity toEntity() {
    return PriceHistoryEntity(id: id, aircraftMarketId: aircraftMarketId, price: price, createdAt: createdAt);
  }
}
