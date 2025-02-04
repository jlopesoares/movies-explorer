import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/details/repository/usecases/details_repository_usecase.dart';

enum DetailsPageState {
  loading,
  loaded,
  error,
}

class DetailsCubit extends Cubit<DetailsPageState> {
  DetailsCubit(this._detailsRepositoryUseCase)
      : super(DetailsPageState.loading);

  late TitleDetails? details;

  final DetailsRepositoryUseCase _detailsRepositoryUseCase;

  Future<void> loadDetails(int titleId) async {
    try {
      final serviceDetail =
          await _detailsRepositoryUseCase.getTitleDetails(titleId);
      details = serviceDetail;

      emit(DetailsPageState.loaded);
    } catch (exception) {
      emit(DetailsPageState.error);
    }
  }
}
