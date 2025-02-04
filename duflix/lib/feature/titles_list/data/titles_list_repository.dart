import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_datasource_usecase.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_repository_usecase.dart';

class TitlesListRepository implements TitlesListRepositoryUseCase {
  const TitlesListRepository(this.datasource);

  @override
  final TitlesListDatasourceUsecase datasource;

  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    return datasource.listTitles(sourceId, page);
  }
}

class MockSuccessTitlesRepository implements TitlesListRepositoryUseCase {
  const MockSuccessTitlesRepository(this.datasource);

  @override
  final TitlesListDatasourceUsecase datasource;

  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    return datasource.listTitles(sourceId, page);
  }
}
