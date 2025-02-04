import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/details/data/details_repository.dart';
import 'package:duflix/feature/details/data/usecases/details_repository_usecase.dart';
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
  final int titleId;

  final DetailsRepositoryUseCase _detailsRepositoryUseCase;

  String? get detailImage => details?.backdrop ?? details?.poster;
  bool get isMock =>
      _detailsRepositoryUseCase.runtimeType == SucessMockDetailsRepository;

  Future<void> loadDetails() async {
    try {
      final serviceDetail =
          await _detailsRepositoryUseCase.getTitleDetails(titleId);
      details = serviceDetail;

      emit(DetailsPageState.loaded);
    } catch (err) {
      emit(DetailsPageState.error);
    }
  }
}

class FancyDetailsCubit extends Cubit<DetailsPageState> {
  FancyDetailsCubit() : super(DetailsPageState.loading);

  void setLoaded() {
    Future.delayed(const Duration(seconds: 5), () {
      emit(DetailsPageState.loaded);
    });
  }
}
