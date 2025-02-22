// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/shipment_docs_model.dart';
// import 'package:aviapoint/src/domain/domain.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should be subclass of ShipmentDocsEntity', () {
//     // Arrange.
//     const ShipmentDocsModel tShipmentDocsModel = ShipmentDocsModel();
//     // act
//     // assert
//     expect(tShipmentDocsModel, isA<ShipmentDocsEntity>());
//   });
//   group('fromJson', () {
//     test('should return Shipment docs model from json', () {
//       // Arrange.
//       const ShipmentDocsModel expected = ShipmentDocsModel(
//         link: "string",
//         format: "string",
//       );
//       // Act.
//       final result = ShipmentDocsModel.fromJson(
//         json.decode(fixture('shipment_docs.json')),
//       );
//       // Assert.
//       expect(result, expected);
//     });

//     test(
//       'should return default Shipment docs model from json with null data',
//       () {
//         // Arrange.
//         const ShipmentDocsModel expected = ShipmentDocsModel(
//           link: '',
//           format: '',
//         );
//         // Act.
//         final result = ShipmentDocsModel.fromJson(
//           json.decode(fixture('shipment_docs_null.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );

//     test(
//       'should return default Shipment docs model from json without all fields except link',
//       () {
//         // Arrange.
//         const ShipmentDocsModel expected = ShipmentDocsModel(
//           link: 'string',
//           format: '',
//         );
//         // Act.
//         final result = ShipmentDocsModel.fromJson(
//           json.decode(fixture('shipment_docs_empty.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );
//   });
// }
