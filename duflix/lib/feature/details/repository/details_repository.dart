import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/details/repository/usecases/details_datasource_usecase.dart';
import 'package:duflix/feature/details/repository/usecases/details_repository_usecase.dart';

class DetailsRepository {
  const DetailsRepository(this._datasource);
  final DetailsDatasourceUsecase _datasource;

  Future<TitleDetails?> getDetails(int titleId) async {
    return _datasource.getTitleDetails(titleId);
  }
}

class SucessMockDetailsRepository implements DetailsRepositoryUseCase {
  const SucessMockDetailsRepository(this.datasource);

  @override
  final DetailsDatasourceUsecase datasource;

  @override
  Future<TitleDetails?> getTitleDetails(int titleId) async {
    // Perform mapping from the response to the model
    // On this assingment, I'll use the api object directly
    // to simulate a successful response
    final response = await datasource.getTitleDetails(titleId);
    return response;
  }
}
