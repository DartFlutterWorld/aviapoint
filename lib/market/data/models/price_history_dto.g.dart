// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceHistoryDto _$PriceHistoryDtoFromJson(Map<String, dynamic> json) =>
    PriceHistoryDto(
      id: (json['id'] as num).toInt(),
      aircraftMarketId: (json['aircraft_market_id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      createdAt: PriceHistoryDto._dateTimeFromJson(json['created_at']),
    );
