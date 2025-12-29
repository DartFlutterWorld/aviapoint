import 'package:equatable/equatable.dart';

class FlightQuestionEntity extends Equatable {
  final int id;
  final int flightId;
  final int? authorId;
  final String questionText;
  final String? answerText;
  final int? answeredById;
  final DateTime? answeredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  // Данные автора вопроса
  final String? authorFirstName;
  final String? authorLastName;
  final String? authorAvatarUrl;
  // Данные пилота, который ответил
  final String? answeredByFirstName;
  final String? answeredByLastName;
  final String? answeredByAvatarUrl;

  const FlightQuestionEntity({
    required this.id,
    required this.flightId,
    this.authorId,
    required this.questionText,
    this.answerText,
    this.answeredById,
    this.answeredAt,
    this.createdAt,
    this.updatedAt,
    this.authorFirstName,
    this.authorLastName,
    this.authorAvatarUrl,
    this.answeredByFirstName,
    this.answeredByLastName,
    this.answeredByAvatarUrl,
  });

  String get authorName {
    if (authorFirstName != null && authorLastName != null) {
      return '${authorFirstName!} ${authorLastName!}'.trim();
    } else if (authorFirstName != null) {
      return authorFirstName!;
    } else if (authorLastName != null) {
      return authorLastName!;
    }
    return 'Посетитель';
  }

  String? get answeredByName {
    if (answeredByFirstName != null && answeredByLastName != null) {
      return '${answeredByFirstName!} ${answeredByLastName!}'.trim();
    } else if (answeredByFirstName != null) {
      return answeredByFirstName;
    } else if (answeredByLastName != null) {
      return answeredByLastName;
    }
    return null;
  }

  @override
  List<Object?> get props => [
    id,
    flightId,
    authorId,
    questionText,
    answerText,
    answeredById,
    answeredAt,
    createdAt,
    updatedAt,
    authorFirstName,
    authorLastName,
    authorAvatarUrl,
    answeredByFirstName,
    answeredByLastName,
    answeredByAvatarUrl,
  ];
}

