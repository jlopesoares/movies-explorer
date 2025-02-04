import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:duflix/core/widgets/title_metadata_row.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<DetailsCubit, DetailsPageState>(
        builder: (context, state) {
          return _screenUI(context);
        },
      ),
    );
  }

  Widget _metadata(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailsCubit.details?.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TitleMetadataRow.filled(
            detailsCubit.details?.type.toString() ?? '',
            detailsCubit.details?.year.toString() ?? '',
          ),
          Row(
            spacing: 8,
            children: _genres(context),
          ),
          Text(
            detailsCubit.details?.plotOverview ?? '',
          ),
          _scores(),
        ],
      ),
    );
  }

  List<DuflixChip> _genres(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();
    return detailsCubit.details?.genreNames.map(DuflixChip.outlined).toList() ??
        [];
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

  Widget _screenUI(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();

    switch (detailsCubit.state) {
      case DetailsPageState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case DetailsPageState.loaded:
        return Column(
          children: [
            Image.asset(
              detailsCubit.details?.poster ?? '',
              fit: BoxFit.cover,
            ),
            _metadata(context),
          ],
        );
      case DetailsPageState.error:
        return const Center(
          child: Text('Error loading details'),
        );
    }
  }
}
