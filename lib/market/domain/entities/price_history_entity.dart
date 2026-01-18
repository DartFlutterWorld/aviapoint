import 'package:equatable/equatable.dart';

class PriceHistoryEntity extends Equatable {
  final int id;
  final int aircraftMarketId;
  final int price;
  final DateTime createdAt;

  const PriceHistoryEntity({
    required this.id,
    required this.aircraftMarketId,
    required this.price,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id, aircraftMarketId, price, createdAt];
}
