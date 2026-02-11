class Anime {
  final int id;
  final String title;
  final String coverImage;

  Anime({required this.id, required this.title, required this.coverImage});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title']['romaji'] ?? json['title']['english'] ?? json['title']['native'],
      coverImage: json['coverImage']['large'],
    );
  }
}
