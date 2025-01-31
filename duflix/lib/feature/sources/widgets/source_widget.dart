import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:flutter/material.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget(this.source, {super.key});

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.movie,
              color: Colors.white,
            ),
            Text(
              source.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
