// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';
// import 'package:aviapoint/src/utils/utils.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should be subclass of WarehouseEntity', () {
//     // Arrange.
//     const WarehouseModel tWarehouseModel = WarehouseModel(
//       id: '1',
//       title: 'string1',
//       address: 'string1',
//       longCoord: '1.000123',
//       latCoord: '2.000123',
//       loadingNorm: 1.0,
//     );
//     // act
//     // assert
//     expect(tWarehouseModel, isA<WarehouseEntity>());
//   });

//   group('fromJson', () {
//     test('should return Staff model from json', () {
//       // Arrange.
//       const WarehouseModel expected = WarehouseModel(
//         id: '1',
//         title: 'string1',
//         address: 'string1',
//         longCoord: '1.000123',
//         latCoord: '2.000123',
//         loadingNorm: 1.0,
//       );
//       // Act.
//       final result = WarehouseModel.fromJson(json.decode(fixture('warehouse_edit.json')));
//       // Assert.
//       expect(result, expected);
//     });

//     test('should return Warehouse model from json with null data', () {
//       // Arrange.
//       const WarehouseModel expected = WarehouseModel(
//         id: '1',
//         title: '',
//         address: '',
//         longCoord: defaultLongitude,
//         latCoord: defaultLatitude,
//         loadingNorm: 0.0,
//       );
//       // Act.
//       final result = WarehouseModel.fromJson(json.decode(fixture('warehouse_null.json')));
//       // Assert.
//       expect(result, expected);
//     });
//   });
// }
