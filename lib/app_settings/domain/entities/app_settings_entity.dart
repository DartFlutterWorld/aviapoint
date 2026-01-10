class AppSettingsEntity {
  final int id;
  final String key;
  final bool value;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AppSettingsEntity({
    required this.id,
    required this.key,
    required this.value,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}
