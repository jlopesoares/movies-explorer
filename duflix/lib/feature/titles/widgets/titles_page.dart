import 'package:duflix/api/gen/watchmode_api.enums.swagger.dart';
import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/titles/widgets/widgets/title_summary_widget.dart';
import 'package:flutter/material.dart';

class TitlesPage extends StatelessWidget {
  const TitlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          );
        },
      ),
    );
  }
}
