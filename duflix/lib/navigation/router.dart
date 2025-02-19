import 'dart:developer';

import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/api/watchmode_api.dart';
import 'package:duflix/app_config.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:duflix/feature/details/data/details_datasource.dart';
import 'package:duflix/feature/details/data/details_repository.dart';
import 'package:duflix/feature/details/details_screen.dart';
import 'package:duflix/feature/sources_list/bloc/sources_cubit.dart';
import 'package:duflix/feature/sources_list/data/souces_repository.dart';
import 'package:duflix/feature/sources_list/data/sources_datasource.dart';
import 'package:duflix/feature/sources_list/sources_page.dart';
import 'package:duflix/feature/titles_list/bloc/titles_list_cubit.dart';
import 'package:duflix/feature/titles_list/data/titles_list_datasource.dart';
import 'package:duflix/feature/titles_list/data/titles_list_repository.dart';
import 'package:duflix/feature/titles_list/widgets/titles_page.dart';
import 'package:duflix/navigation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: '5NwgJGwThjwIh6F42ia3iRldcZxu7JndNK1nqpim',
);

final watchmodeApi = createWatchmodeApi(
  baseUrl: config.watchmodeBaseUrl,
  apiKey: config.watchmodeApiKey,
);

class AppNavigator {
  GoRouter useGoRouter = GoRouter(
    routes: [
      _sourcesRoute(),
    ],
  );

  static GoRoute _sourcesRoute() {
    return GoRoute(
      path: AppRoutes.sources,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SourcesCubit(
            SourcesRepository(
              SourcesDatasource(watchmodeApi),
            ),
          )..loadSources(),
          child: const SourcesScreen(),
        );
      },
      routes: [
        _titlesListRoute(),
      ],
    );
  }

  static GoRoute _titlesListRoute() {
    return GoRoute(
      path: AppRoutes.titles,
      builder: (context, state) {
        final sourceId = state.pathParameters['sourceId'];

        SourceSummary? source;
        if (state.extra is SourceSummary) {
          source = state.extra as SourceSummary?;
        } else {
          log('no extra');
        }

        return BlocProvider(
          create: (_) => TitlesListCubit(
            TitlesListRepository(
              TitlesListDatasource(watchmodeApi),
            ),
            int.parse(sourceId ?? ''),
            source,
          )..loadTitles(),
          child: const TitlesListPage(),
        );
      },
      routes: [
        _detailsRoute(),
      ],
    );
  }

  static GoRoute _detailsRoute() {
    return GoRoute(
      path: AppRoutes.details,
      builder: (context, state) {
        final titleId = state.pathParameters['titleId'];
        return BlocProvider(
          create: (_) => DetailsCubit(
            DetailsRepository(
              DetailsDatasource(watchmodeApi),
            ),
            titleId,
          )..loadDetails(),
          child: const DetailsScreen(),
        );
      },
    );
  }
}
