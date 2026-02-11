import 'package:myapp/core/api/ani_list_api.dart';

class AnimeDataSource {
  Future<List<dynamic>> getTrendingAnime() async {
    return AniListApi.getTrendingAnime();
  }

  Future<Map<String, dynamic>> getAnimeDetails(int animeId) async {
    return AniListApi.getAnimeDetails(animeId);
  }
}
