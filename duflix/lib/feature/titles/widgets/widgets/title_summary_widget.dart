import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:flutter/material.dart';

class TitleSummaryWidget extends StatelessWidget {
  const TitleSummaryWidget(this.titleSummary, {super.key});

  final TitleSummary titleSummary;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => print('Title ${titleSummary.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _titleWidget(titleSummary),
        ),
      ),
    );
  }

  Widget _titleWidget(TitleSummary titleSummary) {
    return Column(
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
        _metadataRow(
          titleSummary.type.name,
          titleSummary.year.toString(),
        ),
      ],
    );
  }

  Widget _metadataRow(String type, String year) {
    return Row(
      spacing: 8,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Text(
              type,
            ),
          ),
        ),
        Text(
          year,
          style: const TextStyle(),
        ),
      ],
    );
  }
}
