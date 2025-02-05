import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources_list/bloc/sources_cubit.dart';
import 'package:duflix/feature/sources_list/domain/sources_rail.dart';
import 'package:duflix/feature/sources_list/widgets/source_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SourcesScreen extends StatelessWidget {
  SourcesScreen({super.key});

  late SourcesCubit _sourcesCubit;

  @override
  Widget build(BuildContext context) {
    _sourcesCubit = context.read<SourcesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sources'),
      ),
      body: BlocBuilder<SourcesCubit, SourcesScreenState>(
        bloc: _sourcesCubit,
        builder: (context, state) {
          return _pageUI(state);
        },
      ),
    );
  }

  Widget _pageUI(SourcesScreenState state) {
    switch (state) {
      case SourcesScreenState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case SourcesScreenState.loaded:
        return ListView.builder(
          itemCount: _sourcesCubit.rails.length,
          itemBuilder: (context, index) {
            return _railWidget(_sourcesCubit.rails[index]);
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
      height: 85,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          return SourceWidget(
            sources[index],
            _navigateToTitle(context, sources[index].id),
          );
        },
      ),
    );
  }

  VoidCallback _navigateToTitle(BuildContext context, int id) {
    return () {
      GoRouter.of(context).go('/titles/$id');
    };
  }
}
