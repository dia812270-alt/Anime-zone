import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/data/models/anime_model.dart';
import 'package:myapp/data/repositories/anime_repository.dart';

final trendingAnimeProvider = FutureProvider.autoDispose<List<Anime>>((ref) async {
  final repository = AnimeRepository();
  // The new API doesn't have a trending endpoint, so we'll search for a popular anime instead.
  return repository.searchAnime('naruto');
});
