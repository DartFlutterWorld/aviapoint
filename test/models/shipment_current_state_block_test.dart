// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should be subclass of ShipmentDocsEntity', () {
//     // Arrange.
//     const ShipmentCurrentStateModel tShipmentCurrentStateBlockModel = ShipmentCurrentStateModel();
//     // act
//     // assert
//     expect(tShipmentCurrentStateBlockModel, isA<ShipmentCurrentStateEntity>());
//   });
//   group('fromJson', () {
//     test('should return Shipment action model from json', () {
//       // Arrange.
//       const ShipmentCurrentStateModel expected = ShipmentCurrentStateModel(
//         header: 'string',
//         subheader: 'string',
//         state: 0,
//         volumeInfo: 'string',
//       );
//       // Act.
//       final result = ShipmentCurrentStateModel.fromJson(
//         json.decode(fixture('shipment_current_state_block.json')),
//       );
//       // Assert.
//       expect(result, expected);
//     });

//     test(
//       'should return default Shipment action model from json with null data',
//       () {
//         // Arrange.
//         const ShipmentCurrentStateModel expected = ShipmentCurrentStateModel(
//           header: '',
//           subheader: '',
//           state: 0,
//           volumeInfo: '',
//         );
//         // Act.
//         final result = ShipmentCurrentStateModel.fromJson(
//           json.decode(fixture('shipment_current_state_block_null.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );

//     test(
//       'should return default Shipment action model from json without all fields except link',
//       () {
//         // Arrange.
//         const ShipmentCurrentStateModel expected = ShipmentCurrentStateModel(
//           header: 'string',
//           subheader: '',
//           state: 0,
//           volumeInfo: '',
//         );
//         // Act.
//         final result = ShipmentCurrentStateModel.fromJson(
//           json.decode(fixture('shipment_current_state_block_empty.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );
//   });
// }
