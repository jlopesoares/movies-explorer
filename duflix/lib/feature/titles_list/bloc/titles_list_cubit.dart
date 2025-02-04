import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TitlesListState { loading, loaded, error, loadingMore }

class TitlesListCubit extends Cubit<TitlesListState> {
  TitlesListCubit(this._titlesRepositoryUseCase, this.sourceId)
      : super(TitlesListState.loading);

  final TitlesListRepositoryUseCase _titlesRepositoryUseCase;
  final int sourceId;

  List<TitleSummary> titles = [];
  TitlesResult? titlesResult;
  int currentPage = 0;

  bool get hasMoreItems => currentPage < (titlesResult?.totalPages ?? 0);
  bool get isLoadingMore => state == TitlesListState.loadingMore;
  bool get isLoadingMoreAvailable => isLoadingMore || !hasMoreItems;

  Future<void> loadTitles() async {
    print("called loadTitles");

    try {
      final titlesResult = await _titlesRepositoryUseCase.listTitles(
        sourceId,
        currentPage + 1,
      );

      if (titles.isEmpty) {
        titles = titlesResult.titles.map((e) => e).toList();
      } else {
        titles.addAll(titlesResult.titles.map((e) => e).toList());
      }

      this.titlesResult = titlesResult;
      currentPage = titlesResult.page;

      emit(TitlesListState.loaded);
    } catch (err) {
      emit(TitlesListState.error);
    }
  }

  Future<void> loadMoreTitles() async {
    if (isLoadingMoreAvailable) {
      return;
    }

    emit(TitlesListState.loadingMore);
    await loadTitles();
    emit(TitlesListState.loaded);
  }
}
