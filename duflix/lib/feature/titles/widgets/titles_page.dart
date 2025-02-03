import 'package:duflix/api/gen/watchmode_api.enums.swagger.dart';
import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/titles/widgets/widgets/title_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitlesPage extends StatelessWidget {
  const TitlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titles'),
        leading: BackButton(onPressed: () => GoRouter.of(context).pop()),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TitleSummaryWidget(
            TitleSummary(
              title: 'Title $index',
              id: index,
              type: TitleType.movie,
              year: 2021,
            ),
            _navigateToDetails(context, index),
          );
        },
      ),
    );
  }

  VoidCallback _navigateToDetails(BuildContext context, int id) {
    return () => GoRouter.of(context)
        .go('${GoRouter.of(context).state.fullPath}/details/$id');
  }
}
