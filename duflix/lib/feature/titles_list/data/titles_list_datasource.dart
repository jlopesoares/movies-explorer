import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_datasource_usecase.dart';

class TitlesListDatasource implements TitlesListDatasourceUsecase {
  const TitlesListDatasource(this.api);

  @override
  final WatchmodeApi api;

  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    final response =
        await api.listTitlesGet(sourceIds: '371', limit: 10, page: 0);
    return response.body!;
  }
}

class MockSuccessTitlesListDataSource implements TitlesListDatasourceUsecase {
  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    return Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        return Future.value(
          const TitlesResult(
            page: 1,
            totalPages: 5,
            totalResults: 100,
            titles: [
              TitleSummary(
                id: 1,
                title: 'title',
                year: 2024,
                type: TitleType.movie,
              ),
              TitleSummary(
                id: 2,
                title: 'title 1231',
                year: 2023,
                type: TitleType.movie,
              ),
            ],
          ),
        );
      },
    );
  }
}
