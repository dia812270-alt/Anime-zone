import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/data/models/anime_model.dart';
import 'package:myapp/data/repositories/anime_repository.dart';

final trendingAnimeProvider = FutureProvider<List<Anime>>((ref) async {
  final repository = AnimeRepository();
  return repository.getTrendingAnime();
});
