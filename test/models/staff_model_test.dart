// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should be subclass of StaffEntity', () {
//     // Arrange.
//     const StaffModel tStaffModel = StaffModel(
//       id: '0',
//       type: 'string',
//       fio: 'string',
//       phoneNumber: 'string',
//       emailOfHead: 'string',
//     );
//     // act
//     // assert
//     expect(tStaffModel, isA<StaffEntity>());
//   });

//   group('fromJson', () {
//     test('should return Staff model from json', () {
//       // Arrange.
//       const StaffModel expected = StaffModel(
//         id: '0',
//         type: 'string',
//         fio: 'string',
//         phoneNumber: 'string',
//         emailOfHead: 'string',
//       );
//       // Act.
//       final result = StaffModel.fromJson(json.decode(fixture('staff.json')));
//       // Assert.
//       expect(result, expected);
//     });

//     test('should return Staff model from json with null data', () {
//       // Arrange.
//       const StaffModel expected = StaffModel(
//         id: '0',
//         type: 'Не указано',
//         fio: 'Не указано',
//         phoneNumber: 'Не указан',
//         emailOfHead: 'Не указан',
//       );
//       // Act.
//       final result = StaffModel.fromJson(json.decode(fixture('staff_null.json')));
//       // Assert.
//       expect(result, expected);
//     });
//   });
// }
