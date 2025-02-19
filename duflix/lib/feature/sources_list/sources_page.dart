import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources_list/bloc/sources_cubit.dart';
import 'package:duflix/feature/sources_list/domain/sources_rail.dart';
import 'package:duflix/feature/sources_list/widgets/source_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sources'),
      ),
      body: BlocBuilder<SourcesCubit, SourcesScreenState>(
        builder: (context, state) {
          return _pageUI(state, context);
        },
      ),
    );
  }

  Widget _pageUI(SourcesScreenState state, BuildContext context) {
    final sourcesCubit = context.watch<SourcesCubit>();
    switch (state) {
      case SourcesScreenState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case SourcesScreenState.loaded:
        return ListView.builder(
          itemCount: sourcesCubit.rails.length,
          itemBuilder: (context, index) {
            return _railWidget(sourcesCubit.rails[index]);
          },
        );
      case SourcesScreenState.error:
        return const Center(
          child: Text('Error loading sources'),
        );
    }
  }

  Widget _railWidget(SourcesRail rail) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _railTitle(rail.title),
        _railList(rail.sources),
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
      height: 140,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          return SourceWidget(
            sources[index],
            _navigateToTitle(context, sources[index].id, sources[index]),
          );
        },
      ),
    );
  }

  VoidCallback _navigateToTitle(
    BuildContext context,
    int id,
    SourceSummary source,
  ) {
    return () {
      GoRouter.of(context).go(
        '/titles/$id',
        extra: source,
      );
    };
  }
}
