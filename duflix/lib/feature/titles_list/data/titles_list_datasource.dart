import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/titles_list/data/usecases/titles_list_datasource_usecase.dart';

class TitlesListDatasource implements TitlesListDatasourceUsecase {
  const TitlesListDatasource(this.api);
  final WatchmodeApi api;

  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    final response = await api.listTitlesGet(
      sourceIds: sourceId.toString(),
      limit: 10,
      page: page,
    );
    return response.body!;
  }
}

class MockSuccessTitlesListDataSourceImpl
    implements TitlesListDatasourceUsecase {
  @override
  Future<TitlesResult> listTitles(int sourceId, int page) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return Future.value(
          TitlesResult(
            page: page,
            totalPages: 2,
            totalResults: 100,
            titles: page == 1
                ? titlesPage1
                : page > 2
                    ? []
                    : titlesPage2,
          ),
        );
      },
    );
  }

  static List<TitleSummary> titlesPage1 = const [
    TitleSummary(
      id: 1,
      title: 'title - page 1',
      year: 2024,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 2,
      title: 'title 1231  - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 3,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 4,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 5,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 6,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 7,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 8,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 9,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 10,
      title: 'title 1231 - page 1',
      year: 2023,
      type: TitleType.movie,
    ),
  ];

  static List<TitleSummary> titlesPage2 = const [
    TitleSummary(
      id: 11,
      title: 'title  - page 2',
      year: 2024,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 12,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 13,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 14,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 15,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 16,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 17,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 18,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 19,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
    TitleSummary(
      id: 20,
      title: 'title 1231- page 2',
      year: 2023,
      type: TitleType.movie,
    ),
  ];
}
