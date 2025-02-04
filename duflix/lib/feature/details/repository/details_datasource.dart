import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/details/repository/usecases/details_datasource_usecase.dart';

class DetailsDatasource {
  const DetailsDatasource(this.api);

  final WatchmodeApi api;

  Future<TitleDetails?> getDetails(int titleId) async {
    final response = await api.titleTitleIdDetailsGet(titleId: titleId);
    return response.body;
  }
}

class MockSucessDetailsDatasource implements DetailsDatasourceUsecase {
  @override
  Future<TitleDetails?> getTitleDetails(int titleId) async {
    return Future.delayed(const Duration(seconds: 5), () {
      return Future.value(
        TitleDetails(
          id: titleId,
          title: 'Lion King',
          type: TitleType.movie,
          year: 2021,
          genreNames: ['Action', 'Adventure'],
          poster: 'assets/images/mufasa.jpg',
          plotOverview:
              'The Lion King tells the story of Simba, a young lion who is to succeed his father, Mufasa, as King of the Pride Lands; however, after Simba\'s uncle Scar murders Mufasa, Simba is manipulated into thinking he was responsible and flees into exile.',
        ),
      );
    });
  }
}
