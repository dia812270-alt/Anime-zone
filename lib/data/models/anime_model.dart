import 'package:myapp/data/models/episode_model.dart';

class Anime {
  final String id;
  final String title;
  final String coverImage;
  final List<Episode> episodes;

  Anime({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.episodes,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'] as String,
      title: json['title'] as String,
      coverImage: json['coverImage'] as String,
      episodes: (json['episodes'] as List<dynamic>? ?? [])
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
