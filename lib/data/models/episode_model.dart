class Episode {
  final String title;
  final String url;

  Episode({required this.title, required this.url});

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
