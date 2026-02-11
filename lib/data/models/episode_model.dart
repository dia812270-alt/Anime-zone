class Episode {
  final String id;
  final String title;

  Episode({
    required this.id,
    required this.title,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }
}
