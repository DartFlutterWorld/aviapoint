class BlogCategoryEntity {
  final int id;
  final String name;
  final String? iconUrl;
  final String? color;
  final int? orderIndex;
  final String? createdAt;
  final String? updatedAt;

  BlogCategoryEntity({
    required this.id,
    required this.name,
    this.iconUrl,
    this.color,
    this.orderIndex,
    this.createdAt,
    this.updatedAt,
  });
}
