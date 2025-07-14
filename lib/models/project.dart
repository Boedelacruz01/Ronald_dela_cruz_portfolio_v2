class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String link;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
  });

  factory Project.fromMap(String id, Map<String, dynamic> data) {
    return Project(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      link: data['link'] ?? '',
    );
  }
}
