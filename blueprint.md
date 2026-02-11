
# Kamanime Flutter App Blueprint

## 1. Overview

This document outlines the architecture, features, and implementation plan for the Kamanime Flutter App. The primary goal is to create a self-contained anime streaming application where all scraping and data extraction logic is embedded within the app itself, running locally on the user's device.

## 2. Core Features

- **Local Backend:** The app will not rely on a remote server. All anime data will be scraped and parsed on the device.
- **Multi-Provider Scraping:** A waterfall strategy will be implemented to fetch data from multiple sources:
    1.  **HiAnime:** Primary source.
    2.  **Gogoanime:** Fallback source.
    3.  **AnimePahe:** Last resort.
- **AniList Integration:** The home screen will feature trending anime fetched from the AniList API.
- **Riverpod State Management:** The app will use `flutter_riverpod` for robust and scalable state management.
- **High-Performance Video Player:** `media_kit` will be used for HLS/m3u8 video playback.
- **Local Caching:** `Hive` will be used to cache anime information and user history for offline access and faster loading.

## 3. Project Structure

```
.
├── lib
│   ├── core
│   │   ├── api
│   │   │   └── ani_list_api.dart
│   │   ├── constants
│   │   │   └── app_constants.dart
│   │   └── utils
│   │       └── app_utils.dart
│   ├── data
│   │   ├── datasources
│   │   │   ├── local_data_source.dart
│   │   │   └── remote_data_source.dart
│   │   ├── models
│   │   │   ├── anime.dart
│   │   │   └── episode.dart
│   │   └── repositories
│   │       └── anime_repository.dart
│   ├── presentation
│   │   ├── providers
│   │   │   ├── anime_provider.dart
│   │   │   └── video_player_provider.dart
│   │   ├── screens
│   │   │   ├── home_screen.dart
│   │   │   ├── search_screen.dart
│   │   │   └── watch_screen.dart
│   │   └── widgets
│   │       ├── anime_card.dart
│   │       ├── custom_app_bar.dart
│   │       └── video_player.dart
│   ├── services
│   │   ├── extractors
│   │   │   ├── hianime_extractor.dart
│   │   │   ├── gogoanime_extractor.dart
│   │   │   └── animepahe_extractor.dart
│   │   └── internal_scraper.dart
│   └── main.dart
├── pubspec.yaml
└── blueprint.md
```

## 4. Implementation Plan

### Step 1: Project Setup

- Initialize a new Flutter project.
- Add the required dependencies to `pubspec.yaml`:
    - `flutter_riverpod`
    - `media_kit`
    - `hive` and `hive_flutter`
    - `dio` or `http` for network requests.
    - `html` for parsing HTML.
- Create the directory structure as outlined above.

### Step 2: Porting the HiAnime Extractor

- Analyze the provided JavaScript extractor logic for HiAnime.
- Create an `HiAnimeExtractor` class in `lib/services/extractors/hianime_extractor.dart`.
- Implement the following methods in pure Dart:
    - `search(query)`: To search for anime.
    - `getAnimeInfo(animeId)`: To fetch anime details, including episodes.
    - `getEpisodeSources(episodeId)`: To extract the m3u8 video URLs.
- Utilize the `http` or `dio` package for making network requests and the `html` package for parsing the scraped HTML.

### Step 3: Building the `InternalScraper`

- Create an `InternalScraper` class in `lib/services/internal_scraper.dart`.
- This class will implement the waterfall strategy, attempting to fetch data from HiAnime first, then falling back to Gogoanime, and finally AnimePahe.

### Step 4: UI and State Management

- **Home Screen:**
    - Use the `ani_list_api.dart` to fetch trending anime from AniList.
    - Display the trending anime in a visually appealing list or grid using `AnimeCard` widgets.
- **Search Screen:**
    - Implement a search bar that uses the `InternalScraper` to search for anime across the supported providers.
- **Watch Screen:**
    - Integrate the `media_kit` video player.
    - Implement a custom UI with controls for play/pause, quality switching, and subtitle selection.
- **Providers:**
    - Create Riverpod providers to manage the state for anime data, search results, and the video player.

### Step 5: Caching

- Integrate Hive to store anime data and watch history.
- When fetching anime information, first check the Hive cache before making a network request.

