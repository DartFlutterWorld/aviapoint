class NewsEntity {
  final int id;
  final String title;
  final String subTitle;
  final String source;
  final String date;
  final String body;
  final String? content; // Quill Delta JSON
  final String pictureMini;
  final String pictureBig;
  final bool isBigNews;
  final int categoryId;
  final bool published;
  final int? authorId;
  final List<String>? additionalImages; // Дополнительные изображения

  NewsEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.source,
    required this.date,
    required this.body,
    this.content,
    required this.pictureMini,
    required this.pictureBig,
    required this.isBigNews,
    required this.categoryId,
    required this.published,
    this.authorId,
    this.additionalImages,
  });
}
