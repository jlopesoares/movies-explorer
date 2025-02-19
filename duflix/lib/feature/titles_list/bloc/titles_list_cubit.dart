import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/titles_list/usecases/titles_list_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TitlesListState { loading, loaded, error, loadingMore }

abstract class TitlesViewModelUseCase {
  void purchaseTVOD();
}

class TitlesListCubit extends Cubit<TitlesListState> {
  TitlesListCubit(this._titlesRepositoryUseCase, this.sourceId, this.source)
      : super(TitlesListState.loading);

  final TitlesListRepositoryUseCase _titlesRepositoryUseCase;
  final int sourceId;
  final SourceSummary? source;

  List<TitleSummary> titles = [];
  TitlesResult? _titlesResult;
  int _currentPage = 0;

  int get numberOfTitles => titles.length;
  bool get hasMoreItems => _currentPage < (_titlesResult?.totalPages ?? 0);
  bool get isLoadingMore => state == TitlesListState.loadingMore;
  bool get isLoadingMoreAvailable => isLoadingMore || !hasMoreItems;

  Future<void> loadTitles() async {
    try {
      final titlesResult = await _titlesRepositoryUseCase.listTitles(
        sourceId,
        _currentPage + 1,
      );

      if (titles.isEmpty) {
        titles = titlesResult.titles.map((e) => e).toList();
      } else {
        titles.addAll(titlesResult.titles.map((e) => e).toList());
      }

      _titlesResult = titlesResult;
      _currentPage = titlesResult.page;

      _setState(TitlesListState.loaded);
    } catch (err) {
      _setState(TitlesListState.error);
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

  void _setState(TitlesListState state) {
    if (isClosed) {
      return;
    }

    emit(state);
  }
}
