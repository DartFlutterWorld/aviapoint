class AnswerEntity {
  AnswerEntity({
    required this.answerId,
    required this.answerText,
    required this.isCorrect,
    required this.isOfficial,
    required this.position,
  });

  final int answerId;
  final String answerText;
  final bool isCorrect;
  final bool isOfficial;
  final int position;
}
