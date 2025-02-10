import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:duflix/core/widgets/duflix_image_downloader.dart';
import 'package:duflix/core/widgets/duflix_title_typeyear_metadata.dart';
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
    final detailsCubit = context.watch<DetailsCubit>();
    switch (detailsCubit.state) {
      case DetailsPageState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case DetailsPageState.loaded:
        return SingleChildScrollView(
          child: _loadedPageState(context),
        );
      case DetailsPageState.error:
        return const Center(
          child: Text('Error loading details'),
        );
    }
  }

  Widget _loadedPageState(BuildContext context) {
    final detailsCubit = context.watch<DetailsCubit>();
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
  }

  SingleChildScrollView _genresWidget(BuildContext context) {
    final detailsCubit = context.watch<DetailsCubit>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: detailsCubit.details?.genreNames
                .map(DuflixChip.outlined)
                .toList() ??
            [],
      ),
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
    final detailsCubit = context.watch<DetailsCubit>();

    if (detailsCubit.isMock) {
      return Image.asset(detailsCubit.detailImage!);
    }

    return DuflixNetworkImage(
      url: detailsCubit.detailImage,
      height: 250,
    );
  }
}
