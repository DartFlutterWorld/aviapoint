// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';

// import '../fixtures/fixture_reader.dart';

// // ignore: long-method
// void main() {
//   test('should be subclass of ProfileEntity', () {
//     // Arrange.
//     const ProfileModel tProfileModel = ProfileModel(
//       id: '0',
//       company: CompanyModel(),
//       verified: false,
//       // edmReleased: false,
//     );
//     // act
//     // assert
//     expect(tProfileModel, isA<ProfileEntity>());
//   });

//   group('fromJson', () {
//     test('should return Profile model from json', () {
//       // Arrange.
//       const ProfileModel expected = ProfileModel(
//         id: '0',
//         company: CompanyModel(
//           nameOfProvider: 'string',
//           headOfProvider: 'string',
//           shortFio: 'string',
//           positionHeadOfProvider: 'string',
//           basicOfDoc: 'string',
//           addressLoad: 'string',
//           ulAddress: 'string',
//           inn: 'string',
//           kpp: 'string',
//           ogrn: 'string',
//           bik: 'string',
//           paymentAccount: 'string',
//           correspondentAccount: 'string',
//           phoneNumber: 'string',
//           emailOfHead: 'string',
//           nameOfBank: 'string',
//           isTaxed: false,
//           staff: [],
//           accreditationStatus: 'string',
//         ),
//         verified: false,
//         // edmReleased: false,
//       );
//       // Act.
//       final result = ProfileModel.fromJson(json.decode(fixture('profile.json')));
//       // Assert.
//       expect(expected, result);
//     });

//     test('should return Profile model from json with null data', () {
//       // Arrange.
//       const ProfileModel expected = ProfileModel(
//         id: '0',
//         company: CompanyModel(
//           nameOfProvider: '',
//           headOfProvider: '',
//           shortFio: '',
//           positionHeadOfProvider: '',
//           basicOfDoc: '',
//           addressLoad: '',
//           ulAddress: '',
//           inn: '',
//           kpp: '',
//           ogrn: '',
//           bik: '',
//           paymentAccount: '',
//           correspondentAccount: '',
//           phoneNumber: '',
//           emailOfHead: '',
//           nameOfBank: '',
//           isTaxed: false,
//           staff: [],
//           accreditationStatus: 'string',
//         ),
//         verified: false,
//         // edmReleased: false,
//       );
//       // Act.
//       final result = ProfileModel.fromJson(json.decode(fixture('profile_null.json')));
//       // Assert.
//       expect(expected, result);
//     });
//   });
// }
