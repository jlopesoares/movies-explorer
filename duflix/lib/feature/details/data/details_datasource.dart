import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/details/usecases/details_datasource_usecase.dart';

class DetailsDatasource implements DetailsDatasourceUsecase {
  const DetailsDatasource(this.api);

  final WatchmodeApi api;

  @override
  Future<TitleDetails?> getTitleDetails(int titleId) async {
    final response = await api.titleTitleIdDetailsGet(titleId: titleId);
    return response.bodyOrThrow;
  }
}

class MockSuccessDetailsDatasource implements DetailsDatasourceUsecase {
  @override
  Future<TitleDetails?> getTitleDetails(int titleId) async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        return Future.value(
          TitleDetails(
            id: titleId,
            title: 'Mufasa',
            type: TitleType.movie,
            year: 2024,
            genreNames: ['Action', 'Adventure'],
            poster: 'assets/images/mufasa_poster.jpg',
            backdrop: 'assets/images/mufasa_backdrop.jpg',
            plotOverview:
                "Mufasa is a lion, the king of the jungle. He has a son, Simba, who will one day take his place as king. Mufasa's brother, Scar, plots to betray Mufasa and take over the throne. Simba is exiled and must return to take his rightful place as king.",
          ),
        );
      },
    );
  }
}
