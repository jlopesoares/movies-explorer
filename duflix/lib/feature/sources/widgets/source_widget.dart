import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:flutter/material.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget(this.source, this.onTap, {super.key});

  final SourceSummary source;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
