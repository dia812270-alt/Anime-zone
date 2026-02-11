import 'package:myapp/core/api/ani_list_api.dart';

class AnimeDataSource {
  Future<List<dynamic>> getTrendingAnime() async {
    return AniListApi.getTrendingAnime();
  }
}
