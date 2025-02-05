import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/details/data/details_repository.dart';
import 'package:duflix/feature/details/usecases/details_repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DetailsPageState {
  loading,
  loaded,
  error,
}

class DetailsCubit extends Cubit<DetailsPageState> {
  DetailsCubit(
    this._detailsRepositoryUseCase,
    this.titleId,
  ) : super(DetailsPageState.loading);

  late TitleDetails? details;
  final String? titleId;

  final DetailsRepositoryUseCase _detailsRepositoryUseCase;

  String? get detailImage => details?.backdrop ?? details?.poster;
  bool get isMock =>
      _detailsRepositoryUseCase.runtimeType == MockSuccessDetailsRepository;

  Future<void> loadDetails() async {
    try {
      final serviceDetail = await _detailsRepositoryUseCase
          .getTitleDetails(int.parse(titleId ?? ''));
      details = serviceDetail;

      _setState(DetailsPageState.loaded);
    } catch (err) {
      _setState(DetailsPageState.error);
    }
  }

  void _setState(DetailsPageState state) {
    if (isClosed) {
      return;
    }
    emit(state);
  }
}
