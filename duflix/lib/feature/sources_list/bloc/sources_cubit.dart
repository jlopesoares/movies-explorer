import 'package:duflix/feature/sources_list/domain/sources_rail.dart';
import 'package:duflix/feature/sources_list/usecases/sources_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SourcesScreenState {
  loading,
  loaded,
  error,
}

class SourcesCubit extends Cubit<SourcesScreenState> {
  SourcesCubit(this._repository) : super(SourcesScreenState.loading);

  final SourcesRepositoryUsecase _repository;
  late List<SourcesRail> rails;

  Future<void> loadSources() async {
    try {
      rails = await _repository.getSources();
      _setState(SourcesScreenState.loaded);
    } catch (err) {
      _setState(SourcesScreenState.error);
    }
  }

  void _setState(SourcesScreenState state) {
    if (isClosed) {
      return;
    }
    emit(state);
  }
}
