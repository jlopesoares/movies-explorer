import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources/widgets/source_widget.dart';
import 'package:flutter/material.dart';

class SourcesPageWidget extends StatelessWidget {
  const SourcesPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return railWidget(
            'Rail Name $index',
            [
              SourceSummary(
                id: 12,
                name: 'Source $index',
                type: SourceType.free,
                logo100px: 'asd',
                regions: ['US'],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget railWidget(String title, List<SourceSummary> sources) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 75,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: sources.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Card(
                  color: Colors.black26,
                  child: SourceWidget(sources[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
