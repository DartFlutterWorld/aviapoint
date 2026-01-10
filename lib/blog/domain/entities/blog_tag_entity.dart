class BlogTagEntity {
  final int id;
  final String name;
  final String slug;
  final String? createdAt;

  BlogTagEntity({required this.id, required this.name, required this.slug, this.createdAt});
}
