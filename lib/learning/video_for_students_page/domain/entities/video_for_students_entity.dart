import 'package:equatable/equatable.dart';

class VideoForStudentsEntity extends Equatable {
  final int id;
  final String title;
  final String fileName;
  final String url;

  const VideoForStudentsEntity({
    required this.id,
    required this.title,
    required this.fileName,
    required this.url,
  });

  @override
  List<Object?> get props => [id, title, fileName, url];
}
