class StoryEntity {
  final int id;
  final String? image;
  final String? video;
  final String textButton;
  final String hyperlink;
  final int timeShow;
  final int position;
  final String colorButton;
  final String logoStory;
  final String textColor;

  StoryEntity({
    required this.id,
    required this.image,
    this.video,
    required this.textButton,
    required this.hyperlink,
    required this.timeShow,
    required this.position,
    required this.colorButton,
    required this.logoStory,
    required this.textColor,
  });
}
