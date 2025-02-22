// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';

// import '../fixtures/fixture_reader.dart';

// // ignore: long-method
// void main() {
//   test('should be subclass of ShipmentEntity', () {
//     // Arrange.
//     const ShipmentTableModel tShipmentTableModel = ShipmentTableModel();
//     // act
//     // assert
//     expect(tShipmentTableModel, isA<ShipmentTableEnitity>());
//   });
//   group('fromJson', () {
//     test(
//       'should return Shipment table model from json',
//       () {
//         // Arrange.
//         const ShipmentTableModel expected = ShipmentTableModel(
//           opened: false,
//           header: 'string',
//           subheader: 'string',
//           canShare: true,
//           data: {
//             "string": [
//               {"string": "string"},
//               {"string": true},
//               {"string": 0},
//             ],
//           },
//           footer: [],
//         );
//         // Act.
//         final result = ShipmentTableModel.fromJson(
//           json.decode(fixture('shipment_table.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );

//     test(
//       'should return default Shipment table model from json with null data',
//       () {
//         // Arrange.
//         const ShipmentTableModel expected = ShipmentTableModel(
//           opened: false,
//           header: '',
//           subheader: '',
//           canShare: false,
//           data: {},
//           footer: [],
//         );
//         // Act.
//         final result = ShipmentTableModel.fromJson(
//           json.decode(fixture('shipment_table_null.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );

//     test(
//       'should return default Shipment table model from json without all fields except header',
//       () {
//         // Arrange.
//         const ShipmentTableModel expected = ShipmentTableModel(
//           opened: false,
//           header: 'string',
//           subheader: '',
//           canShare: false,
//           data: {},
//         );
//         // Act.
//         final result = ShipmentTableModel.fromJson(
//           json.decode(fixture('shipment_table_empty.json')),
//         );
//         // Assert.
//         expect(result, expected);
//       },
//     );
//   });
// }
