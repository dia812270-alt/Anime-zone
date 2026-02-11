# Kamanime API (Backend)

This repository contains the API backend for Kamanime, built with Bun/Node.

Author: karma hacks

## Overview

- Serves anime data to the `kamanime` frontend.
- Provides endpoints for homepage, detail pages, characters, episodes, and search.

## Requirements

- Bun (or Node.js)

## Setup

```powershell
cd kamanime-API
npm install
```

## Run (development)

```powershell
npm run dev
```

## Project Structure

- `src/` — application source
- `src/controllers/` — request handlers
- `src/extractor/` — data extraction logic
- `src/routes/` — express route definitions

## Notes

Adjust `src/config/dataUrl.js` if target source URLs change.
