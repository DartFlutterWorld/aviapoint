class NewsEntity {
  final int id;
  final String title;
  final String subTitle;
  final String source;
  final String date;
  final String body;
  final String pictureMini;
  final String pictureBig;
  final bool isBigNews;
  final int categoryId;

  NewsEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.source,
    required this.date,
    required this.body,
    required this.pictureMini,
    required this.pictureBig,
    required this.isBigNews,
    required this.categoryId,
  });
}
