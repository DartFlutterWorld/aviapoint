// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:aviapoint/src/data/models/stage_progress_model.dart';
// import 'package:aviapoint/src/domain/entities/state_progress_entity.dart';

// import '../fixtures/fixture_reader.dart';

// void main() {
//   test('should be subclass of StageProgressEntity', () {
//     // Arrange.
//     const StageProgressModel tStageProgressModel = StageProgressModel(total: '10', current: '1', percent: 10);
//     // act
//     // assert
//     expect(tStageProgressModel, isA<StageProgressEntity>());
//   });

//   group('fromJson', () {
//     test('should return StageProgressModel from json', () {
//       // Arrange.
//       const StageProgressModel tStageProgressModel = StageProgressModel(total: '10', current: '1', percent: 10);
//       // Act.
//       final result = StageProgressModel.fromJson(
//         json.decode(
//           fixture('stage_progress.json'),
//         ),
//       );
//       // Assert.
//       expect(result, tStageProgressModel);
//     });
//   });
// }
