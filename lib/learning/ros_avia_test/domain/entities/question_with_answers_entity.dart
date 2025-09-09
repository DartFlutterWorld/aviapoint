// Модель Воздушные скорости в аварифных ситуациях
import 'package:aviapoint/learning/ros_avia_test/domain/entities/answer_entity.dart';

class QuestionWithAnswersEntity {
  QuestionWithAnswersEntity({
    required this.questionId,
    required this.questionText,
    this.explanation,
    this.correctAnswer,
    required this.answers,
  });

  final int questionId;
  final String questionText;
  final String? explanation;
  final int? correctAnswer;
  final List<AnswerEntity> answers;
}
