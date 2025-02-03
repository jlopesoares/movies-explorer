import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/core/widgets/title_metadata_row.dart';
import 'package:flutter/material.dart';

class TitleSummaryWidget extends StatelessWidget {
  const TitleSummaryWidget(this.titleSummary, this.onTap, {super.key});

  final TitleSummary titleSummary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleSummary.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TitleMetadataRow.outlined(
                titleSummary.type.name,
                titleSummary.year.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
