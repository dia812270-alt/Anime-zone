import 'package:dio/dio.dart';
import 'package:myapp/core/constants/app_constants.dart';
import 'package:myapp/data/models/anime_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Anime>> searchAnime(String query) async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}/anime/search?q=$query');
      final List<dynamic> results = response.data['results'];
      return results.map((json) => Anime.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search anime: $e');
    }
  }

  Future<Anime> getAnimeDetails(String animeId) async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}/anime/info?id=$animeId');
      return Anime.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get anime details: $e');
    }
  }

  Future<String> getEpisodeStreamUrl(String episodeId) async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}/anime/episode-srcs?id=$episodeId');
      return response.data['sources'][0]['url']; // Assuming the first source is the desired one
    } catch (e) {
      throw Exception('Failed to get episode stream URL: $e');
    }
  }
}
