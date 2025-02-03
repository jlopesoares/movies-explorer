import 'package:duflix/feature/details/details_widget.dart';
import 'package:duflix/feature/sources/sources_page.dart';
import 'package:duflix/feature/titles/widgets/titles_page.dart';
import 'package:duflix/navigation/routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  GoRouter useGoRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.sources,
        builder: (context, state) => const SourcesPage(),
        routes: [
          GoRoute(
            path: AppRoutes.titles,
            builder: (context, state) => const TitlesPage(),
            routes: [
              GoRoute(
                path: AppRoutes.details,
                builder: (context, state) => const DetailsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
