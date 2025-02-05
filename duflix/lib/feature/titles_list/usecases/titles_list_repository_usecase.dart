import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/titles_list/usecases/titles_list_datasource_usecase.dart';

abstract class TitlesListRepositoryUseCase {
  const TitlesListRepositoryUseCase(this.datasource);
  final TitlesListDatasourceUsecase datasource;

  Future<TitlesResult> listTitles(int sourceId, int page);
}
