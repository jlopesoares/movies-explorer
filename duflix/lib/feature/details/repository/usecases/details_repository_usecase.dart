import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/details/repository/usecases/details_datasource_usecase.dart';

abstract class DetailsRepositoryUseCase {
  const DetailsRepositoryUseCase(this.datasource);
  final DetailsDatasourceUsecase datasource;

  Future<TitleDetails?> getTitleDetails(int titleId);
}
