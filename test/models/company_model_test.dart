// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/models.dart';
// import 'package:aviapoint/src/domain/entities/entities.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should  be subclass of Company Entity', () {
//     // Arrange.
//     const CompanyModel tCompanyModel = CompanyModel();
//     // Act.
//     // Assert.
//     expect(tCompanyModel, isA<CompanyEntity>());
//   });

//   group('fromJson', () {
//     test('should return Company model from json', () {
//       // Arrange.
//       const CompanyModel tCompanyModel = CompanyModel(
//         nameOfProvider: 'string',
//         headOfProvider: 'string',
//         shortFio: 'string',
//         positionHeadOfProvider: 'string',
//         basicOfDoc: 'string',
//         addressLoad: 'string',
//         ulAddress: 'string',
//         inn: 'string',
//         kpp: 'string',
//         ogrn: 'string',
//         bik: 'string',
//         paymentAccount: 'string',
//         correspondentAccount: 'string',
//         phoneNumber: 'string',
//         emailOfHead: 'string',
//         nameOfBank: 'string',
//         isTaxed: false,
//         staff: [],
//       );
//       // Act.
//       final result = CompanyModel.fromJson(json.decode(fixture('company.json')));
//       // Assert.
//       expect(result, tCompanyModel);
//     });
//   });
// }
