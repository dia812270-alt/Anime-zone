import 'dart:convert';
import 'package:http/http.dart' as http;

class AniListApi {
  static const String _apiBaseUrl = 'https://graphql.anilist.co';

  static Future<List<dynamic>> getTrendingAnime() async {
    const query = """
      query {
        Page(page: 1, perPage: 10) {
          media(sort: TRENDING_DESC, type: ANIME) {
            id
            title {
              romaji
              english
              native
            }
            coverImage {
              large
            }
          }
        }
      }
    """;

    final response = await http.post(
      Uri.parse(_apiBaseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'query': query,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['Page']['media'];
    } else {
      throw Exception('Failed to load trending anime');
    }
  }

  static Future<Map<String, dynamic>> getAnimeDetails(int animeId) async {
    const query = """
      query (\$id: Int) {
        Media(id: \$id, type: ANIME) {
          id
          title {
            romaji
            english
            native
          }
          coverImage {
            large
          }
          streamingEpisodes {
            title
            url
          }
        }
      }
    """;

    final response = await http.post(
      Uri.parse(_apiBaseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'query': query,
        'variables': {'id': animeId},
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // The episodes are in `streamingEpisodes`, so I'll rename the key to `episodes` to match my model
      final media = data['data']['Media'];
      if (media['streamingEpisodes'] != null) {
        media['episodes'] = media['streamingEpisodes'];
        media.remove('streamingEpisodes');
      }
      return media;
    } else {
      throw Exception('Failed to load anime details');
    }
  }
}
