import 'package:myapp/data/datasources/anime_datasource.dart';
import 'package:myapp/data/models/anime_model.dart';

class AnimeRepository {
  final AnimeDataSource _dataSource = AnimeDataSource();

  Future<List<Anime>> getTrendingAnime() async {
    final List<dynamic> animeData = await _dataSource.getTrendingAnime();
    return animeData.map((data) => Anime.fromJson(data)).toList();
  }

  Future<Anime> getAnimeDetails(int animeId) async {
    final Map<String, dynamic> animeData = await _dataSource.getAnimeDetails(animeId);
    return Anime.fromJson(animeData);
  }
}
