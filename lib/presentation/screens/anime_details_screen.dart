import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/data/models/anime_model.dart';
import 'package:myapp/data/repositories/anime_repository.dart';
import 'package:myapp/presentation/screens/watch_screen.dart';

final animeDetailsProvider = FutureProvider.autoDispose.family<Anime, int>((ref, animeId) {
  return AnimeRepository().getAnimeDetails(animeId);
});

class AnimeDetailsScreen extends ConsumerWidget {
  final int animeId;

  const AnimeDetailsScreen({super.key, required this.animeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeDetails = ref.watch(animeDetailsProvider(animeId));

    return Scaffold(
      appBar: AppBar(),
      body: animeDetails.when(
        data: (anime) => SingleChildScrollView(
          child: Column(
            children: [
              Image.network(anime.coverImage),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(anime.title, style: Theme.of(context).textTheme.headlineSmall),
              ),
              if (anime.episodes.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: anime.episodes.length,
                  itemBuilder: (context, index) {
                    final episode = anime.episodes[index];
                    return ListTile(
                      title: Text(episode.title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WatchScreen(episodeUrl: episode.url),
                          ),
                        );
                      },
                    );
                  },
                )
              else
                const Center(
                  child: Text('No episodes available.'),
                ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
