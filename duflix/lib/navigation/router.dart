import 'package:duflix/api/watchmode_api.dart';
import 'package:duflix/app_config.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:duflix/feature/details/data/details_datasource.dart';
import 'package:duflix/feature/details/data/details_repository.dart';
import 'package:duflix/feature/details/details_screen.dart';
import 'package:duflix/feature/sources/sources_page.dart';
import 'package:duflix/feature/titles/widgets/titles_page.dart';
import 'package:duflix/navigation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

final watchmodeApi = createWatchmodeApi(
  baseUrl: config.watchmodeBaseUrl,
  apiKey: config.watchmodeApiKey,
);

class AppNavigator {
  GoRouter useGoRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.sources,
        builder: (context, state) => const SourcesPage(),
        routes: [
          _titlesListRoute(),
        ],
      ),
    ],
  );

  static GoRoute _titlesListRoute() {
    return GoRoute(
      path: AppRoutes.titles,
      builder: (context, state) => const TitlesPage(),
      routes: [
        _detailsRoute(),
      ],
    );
  }

  static GoRoute _detailsRoute() {
    return GoRoute(
      path: AppRoutes.details,
      builder: (context, state) => BlocProvider(
        create: (_) => DetailsCubit(
          SucessMockDetailsRepository(
            MockSucessDetailsDatasource(),
          ),
        )..loadDetails(03256235),
        child: const DetailsScreen(),
      ),
    );
  }
}
