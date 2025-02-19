import 'package:duflix/core/widgets/duflix_image_downloader.dart';
import 'package:duflix/feature/titles_list/bloc/titles_list_cubit.dart';
import 'package:duflix/feature/titles_list/widgets/widgets/title_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TitlesListPage extends StatefulWidget {
  const TitlesListPage({super.key});

  @override
  _TitlesListPageState createState() => _TitlesListPageState();
}

class _TitlesListPageState extends State<TitlesListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        (_scrollController.position.maxScrollExtent - 50)) {
      context.read<TitlesListCubit>().loadMoreTitles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final titlesListCubit = context.watch<TitlesListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            DuflixNetworkImage(
              url: titlesListCubit.source?.logo100px,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(titlesListCubit.source?.name ?? ''),
          ],
        ),
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
    final titlesListCubit = context.watch<TitlesListCubit>();
    switch (titlesListCubit.state) {
      case TitlesListState.loading:
        return const Center(child: CircularProgressIndicator());
      case TitlesListState.loaded:
      case TitlesListState.loadingMore:
        return ListView.builder(
          controller: _scrollController,
          itemCount: titlesListCubit.titles.length +
              (titlesListCubit.hasMoreItems ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == titlesListCubit.titles.length) {
              return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return TitleSummaryWidget(
              titlesListCubit.titles[index],
              _navigateToDetails(
                context,
                titlesListCubit.titles[index].id,
              ),
            );
          },
        );
      case TitlesListState.error:
        return const Center(child: Text('Error loading titles'));
    }
  }

  VoidCallback _navigateToDetails(BuildContext context, int id) {
    return () => GoRouter.of(context).go('./details/$id');
  }
}
