import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/providers/trending_anime_provider.dart';
import 'package:myapp/presentation/widgets/anime_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingAnime = ref.watch(trendingAnimeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamanime'),
      ),
      body: trendingAnime.when(
        data: (animeList) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              final anime = animeList[index];
              return AnimeCard(anime: anime);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
