import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:duflix/core/widgets/title_metadata_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: BackButton(
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/mufasa.jpg',
            fit: BoxFit.cover,
          ),
          _metadata(),
        ],
      ),
    );
  }

  Widget _metadata() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'The Lion King',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TitleMetadataRow.filled(
            'Movie',
            '1994',
          ),
          const Row(
            spacing: 8,
            children: [
              DuflixChip.outlined('text'),
              DuflixChip.outlined('text'),
              DuflixChip.outlined('text'),
              DuflixChip.outlined('text'),
            ],
          ),
          const Text(
            'long metadata text long metadata text long metadata text long metadata text long metadata text long metadata text long metadata text long metadata text long metadata text ',
          ),
          _scores(),
        ],
      ),
    );
  }

  Widget _scores() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Critic Score: 90',
        ),
        Text(
          'Critic Score: 90',
        ),
        Text(
          'Critic Score: 90',
        ),
      ],
    );
  }
}
