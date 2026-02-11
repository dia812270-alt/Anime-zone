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
}
