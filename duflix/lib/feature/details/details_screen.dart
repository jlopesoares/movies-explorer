import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:duflix/core/widgets/duflix_image_downloader.dart';
import 'package:duflix/core/widgets/duflix_title_typeyear_metadata.dart';
import 'package:duflix/feature/details/bloc/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  late DetailsCubit _detailsCubit;

  @override
  Widget build(BuildContext context) {
    _detailsCubit = context.read<DetailsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: BackButton(
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: BlocBuilder<DetailsCubit, DetailsPageState>(
        bloc: _detailsCubit,
        builder: (context, state) {
          return _screenUIState(context);
        },
      ),
    );
  }

  Widget _screenUIState(BuildContext context) {
    switch (_detailsCubit.state) {
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
                _detailsCubit.details?.title ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TitleTypeAndYearMetadata.filled(
                _detailsCubit.details?.type.name ?? '',
                _detailsCubit.details?.year.toString() ?? '',
              ),
              _genresWidget(context),
              Text(
                _detailsCubit.details?.plotOverview ?? '',
              ),
              _scoresWidget(
                _detailsCubit.details?.criticScore,
                _detailsCubit.details?.userRating,
                _detailsCubit.details?.relevancePercentile,
              ),
            ],
          ),
        ),
      ],
    );
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

    return DuflixNetworkImage(
      url: detailsCubit.detailImage,
      height: 250,
    );
  }
}
