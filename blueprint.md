# Anime App Blueprint

## Overview

This document outlines the blueprint for a Flutter application that allows users to browse and watch anime. The application fetches data from the AniList API and provides a simple, intuitive interface for users to discover and enjoy their favorite anime series.

## Features

- **Trending Anime:** The main screen displays a list of currently trending anime, providing users with a quick overview of what's popular.
- **Anime Details:** Users can tap on an anime to view more details, including a summary, cover image, and a list of available episodes.
- **Episode Streaming:** Users can select an episode to watch it directly within the app.
- **State Management:** The application uses `flutter_riverpod` for state management, ensuring a clean and scalable architecture.

## Current Task

**Implement Anime Details Screen**

- **Goal:** Create a screen that displays detailed information about a selected anime, including its title, cover image, and a list of episodes.
- **Steps:**
  1.  **Create `anime_details_screen.dart`:** This file will contain the UI for the anime details screen.
  2.  **Fetch Anime Details:** Implement the necessary logic to fetch detailed information for a specific anime from the AniList API.
  3.  **Display Anime Details:** Render the fetched data on the screen, including the cover image, title, and a list of episodes.
  4.  **Navigate to Watch Screen:** Allow users to tap on an episode to navigate to the `watch_screen.dart` and stream the selected episode.

