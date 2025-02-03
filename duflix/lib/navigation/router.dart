import 'package:duflix/feature/details/details_widget.dart';
import 'package:duflix/feature/sources/sources_page.dart';
import 'package:duflix/feature/titles/widgets/titles_page.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  GoRouter useGoRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SourcesPage(),
        routes: [
          GoRoute(
            path: '/titles/:sourceId',
            builder: (context, state) => const TitlesPage(),
            routes: [
              GoRoute(
                path: '/details',
                builder: (context, state) => const DetailsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
