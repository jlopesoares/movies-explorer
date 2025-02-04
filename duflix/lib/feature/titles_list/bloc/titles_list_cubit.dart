import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TitlesListState { loading, loaded, error }

class TitlesListCubit extends Cubit<TitlesListState> {
  TitlesListCubit(this._titlesRepositoryUseCase)
      : super(TitlesListState.loading);

  final TitlesListRepositoryUseCase _titlesRepositoryUseCase;

  List<TitleSummary> titles = [];
  int currentPage = 0;

  Future<void> loadTitles(int sourceId, int page) async {
    try {
      final serviceTitles = await _titlesRepositoryUseCase.listTitles(
        sourceId,
        page,
      );
      titles = serviceTitles.titles.map((e) => e).toList();

      emit(TitlesListState.loaded);
    } catch (err) {
      emit(TitlesListState.error);
    }
  }
}
