import 'package:equatable/equatable.dart';

/// Структурированный адрес для объявлений маркета (по данным Nominatim).
class MarketAddressEntity extends Equatable {
  final String? country;
  final String? region;
  final String? city;
  final String? street;
  final String? houseNumber;
  final String? postcode;

  const MarketAddressEntity({
    this.country,
    this.region,
    this.city,
    this.street,
    this.houseNumber,
    this.postcode,
  });

  @override
  List<Object?> get props => [country, region, city, street, houseNumber, postcode];
}

