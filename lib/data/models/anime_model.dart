import 'package:myapp/data/models/episode_model.dart';

class Anime {
  final int id;
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
    var episodes = <Episode>[];
    if (json['episodes'] != null) {
      episodes = List<Episode>.from(
          json['episodes'].map((e) => Episode.fromMap(e)));
    }

    return Anime(
      id: json['id'],
      title: json['title']['romaji'] ??
          json['title']['english'] ??
          json['title']['native'],
      coverImage: json['coverImage']['large'],
      episodes: episodes,
    );
  }
}
