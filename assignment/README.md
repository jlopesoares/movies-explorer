# Assignment

The goal of the assignment is to create an app for browsing movies and TV shows from various sources.
Refer to `demo.webm` for a demonstration of the app, its features and its UI.

Implement a feature-based architecture, using the `provider` and `bloc` packages.
`leancode_cubit_utils` might be useful too.

> [!NOTE]
> Pay attention to code analysis – make sure there are no issues reported by the analyzer.

## API

The API for this app can be created with the `createWatchmodeApi` function located in
`lib/api/watchmode_api.dart`.

> [!IMPORTANT]
> API keys have a monthly call limit. Since the default key is shared, you may quickly run out of
> calls. In that case, generate your own key at the [Watchmode API page](https://api.watchmode.com/requestApiKey/).

## Demo

See the demo video at `demo.webm`.

## Screens

### Sources

Displays available sources, grouped by their type.

API endpoint: `/sources/` (`WatchmodeApi.sourcesGet`).

### Source titles

Displays titles for a specific source (source by ID).

API endpoint: `/list-titles/` (`WatchmodeApi.listTitlesGet`). ***This endpoint uses pagination.***

### Title details

Displays details for a specific title (title by ID).

API endpoint: `/title/{title_id}/details/` (`WatchmodeApi.titleTitleIdDetailsGet`).
