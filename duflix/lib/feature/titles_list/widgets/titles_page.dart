import 'package:duflix/api/gen/watchmode_api.enums.swagger.dart';
import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/titles_list/bloc/titles_list_cubit.dart';
import 'package:duflix/feature/titles_list/widgets/widgets/title_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TitlesPage extends StatelessWidget {
  const TitlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titles'),
        leading: BackButton(onPressed: () => GoRouter.of(context).pop()),
      ),
      body: BlocBuilder<TitlesListCubit, TitlesListState>(
        builder: (context, state) {
          return _pageUIState(context);
        },
      ),
    );
  }

  Widget _pageUIState(BuildContext context) {
    final TitlesListCubit titlesListCubit = context.read<TitlesListCubit>();

    switch (titlesListCubit.state) {
      case TitlesListState.loading:
        return const Center(child: CircularProgressIndicator());
      case TitlesListState.loaded:
        return ListView.builder(
          itemCount: titlesListCubit.titles.length,
          itemBuilder: (context, index) {
            return TitleSummaryWidget(
              titlesListCubit.titles[index],
              _navigateToDetails(context, titlesListCubit.titles[index].id),
            );
          },
        );
      case TitlesListState.error:
        return const Center(child: Text('Error loading titles'));
    }
  }

  VoidCallback _navigateToDetails(BuildContext context, int id) {
    return () => GoRouter.of(context)
        .go('${GoRouter.of(context).state.fullPath}/details/$id');
  }
}
