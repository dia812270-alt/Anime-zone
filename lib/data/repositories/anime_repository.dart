import 'package:myapp/core/api/api_service.dart';
import 'package:myapp/data/models/anime_model.dart';

class AnimeRepository {
  final ApiService _apiService = ApiService();

  Future<List<Anime>> searchAnime(String query) {
    return _apiService.searchAnime(query);
  }

  Future<Anime> getAnimeDetails(String animeId) {
    return _apiService.getAnimeDetails(animeId);
  }

  Future<String> getEpisodeStreamUrl(String episodeId) {
    return _apiService.getEpisodeStreamUrl(episodeId);
  }
}
