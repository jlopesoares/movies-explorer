import 'package:duflix/feature/sources_list/data/souces_repository.dart';
import 'package:duflix/feature/sources_list/domain/sources_rail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SourcesScreenState {
  loading,
  loaded,
  error,
}

class SourcesCubit extends Cubit<SourcesScreenState> {
  SourcesCubit(this._repository) : super(SourcesScreenState.loading);

  final SourcesRepository _repository;
  late List<SourcesRail> rails;

  Future<void> loadSources() async {
    rails = await _repository.getSources();
    emit(SourcesScreenState.loaded);
  }
}
