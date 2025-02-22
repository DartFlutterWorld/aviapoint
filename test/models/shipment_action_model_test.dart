// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/shipment_action_model.dart';
// import 'package:aviapoint/src/domain/entities/shipment_action_entity.dart';

// import '../fixtures/fixture_reader.dart';

// // ignore: long-method
// void main() {
//   test('should be subclass of ShipmentDocsEntity', () {
//     // Arrange.
//     const ShipmentActionModel tShipmentActionModel = ShipmentActionModel();
//     // act
//     // assert
//     expect(tShipmentActionModel, isA<ShipmentActionEntity>());
//   });
//   group('fromJson', () {
//     test('should return Shipment action model from json', () {
//       // Arrange.
//       const ShipmentActionModel expected = ShipmentActionModel(
//         header: 'string',
//         subheader: 'string',
//         codeOne: 'string',
//         codeTwo: 'string',
//         bottomText: 'string',
//       );
//       // Act.
//       final result = ShipmentActionModel.fromJson(
//         json.decode(
//           fixture('shipment_action.json'),
//         ),
//       );
//       // Assert.
//       expect(result, expected);
//     });

//     test(
//       'should return default Shipment action model from json with null data',
//       () {
//         // Arrange.
//         const ShipmentActionModel expected = ShipmentActionModel(
//           header: '',
//           subheader: '',
//           codeOne: '',
//           codeTwo: '',
//           bottomText: '',
//         );
//         // Act.
//         final result = ShipmentActionModel.fromJson(
//           json.decode(fixture('shipment_action_null.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );

//     test(
//       'should return default Shipment action model from json without all fields except link',
//       () {
//         // Arrange.
//         const ShipmentActionModel expected = ShipmentActionModel(
//           header: 'string',
//           subheader: '',
//           codeOne: '',
//           codeTwo: '',
//           bottomText: '',
//         );
//         // Act.
//         final result = ShipmentActionModel.fromJson(
//           json.decode(fixture('shipment_action_empty.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );
//   });
// }
