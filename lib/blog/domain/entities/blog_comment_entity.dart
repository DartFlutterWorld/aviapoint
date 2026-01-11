import 'package:equatable/equatable.dart';

class BlogCommentEntity extends Equatable {
  final int id;
  final int articleId;
  final int authorId;
  final int? parentCommentId;
  final String content;
  final bool isApproved;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  
  // Данные автора комментария
  final String? authorFirstName;
  final String? authorLastName;
  final String? authorAvatarUrl;
  final double? authorRating;

  const BlogCommentEntity({
    required this.id,
    required this.articleId,
    required this.authorId,
    this.parentCommentId,
    required this.content,
    this.isApproved = true,
    this.createdAt,
    this.updatedAt,
    this.authorFirstName,
    this.authorLastName,
    this.authorAvatarUrl,
    this.authorRating,
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

  @override
  List<Object?> get props => [
        id,
        articleId,
        authorId,
        parentCommentId,
        content,
        isApproved,
        createdAt,
        updatedAt,
        authorFirstName,
        authorLastName,
        authorAvatarUrl,
        authorRating,
      ];
}
