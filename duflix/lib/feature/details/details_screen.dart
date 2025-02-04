import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:duflix/core/widgets/title_metadata_row.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
          return _screenUIState(context);
        },
      ),
    );
  }

  Widget _screenUIState(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();

    switch (detailsCubit.state) {
      case DetailsPageState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case DetailsPageState.loaded:
        return Column(
          children: [
            _imageWidget(context),
            Padding(
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
                  TitleTypeAndYearMetadata.filled(
                    detailsCubit.details?.type.name ?? '',
                    detailsCubit.details?.year.toString() ?? '',
                  ),
                  _genresWidget(context),
                  Text(
                    detailsCubit.details?.plotOverview ?? '',
                  ),
                  _scoresWidget(
                    detailsCubit.details?.criticScore,
                    detailsCubit.details?.userRating,
                    detailsCubit.details?.relevancePercentile,
                  ),
                ],
              ),
            ),
          ],
        );
      case DetailsPageState.error:
        return const Center(
          child: Text('Error loading details'),
        );
    }
  }

  Row _genresWidget(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();
    return Row(
      spacing: 8,
      children:
          detailsCubit.details?.genreNames.map(DuflixChip.outlined).toList() ??
              [],
    );
  }

  Widget _scoresWidget(int? criticScore, double? userScore, double? relevance) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (criticScore != null)
          Text(
            'Critic Score: $criticScore',
          ),
        if (userScore != null)
          Text(
            'User Score: $userScore',
          ),
        if (relevance != null)
          Text(
            'Relevance Score: $relevance',
          ),
      ],
    );
  }

  Widget _imageWidget(BuildContext context) {
    final DetailsCubit detailsCubit = context.read<DetailsCubit>();

    if (detailsCubit.isMock) {
      return Image.asset(detailsCubit.detailImage!);
    }

    return detailsCubit.detailImage != null
        ? Image.network(detailsCubit.detailImage!)
        : const Placeholder(
            fallbackHeight: 200,
          );
  }
}
