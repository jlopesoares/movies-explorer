import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources/widgets/source_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourcesPage extends StatelessWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sources'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _railWidget(
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

  Widget _railWidget(String title, List<SourceSummary> sources) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _railTitle(title),
        _railList(sources),
      ],
    );
  }

  Widget _railTitle(String title) {
    return Padding(
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
    );
  }

  Widget _railList(List<SourceSummary> sources) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          return SourceWidget(
            sources[index],
            _navigateToTitle(context, sources[index].id),
          );
        },
      ),
    );
  }

  VoidCallback _navigateToTitle(BuildContext context, int id) {
    return () {
      GoRouter.of(context).go('/titles/$id');
    };
  }
}
