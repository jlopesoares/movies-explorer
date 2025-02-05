import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources_list/data/usecases/sources_datasource_usecase.dart';

class SourcesDatasource implements SourcesDatasourceUsecase {
  const SourcesDatasource(this.api);

  final WatchmodeApi api;

  @override
  Future<List<SourceSummary>> getSources() async {
    final response = await api.sourcesGet();
    return response.body!;
  }
}

class MockSuccessSourcesDatasource implements SourcesDatasourceUsecase {
  @override
  Future<List<SourceSummary>> getSources() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return Future.value(
        const [
          SourceSummary(
            id: 1,
            name: 'Netflix',
            type: SourceType.free,
            logo100px: '',
            regions: [],
          ),
          SourceSummary(
            id: 2,
            name: 'AppleTV+',
            type: SourceType.free,
            logo100px: '',
            regions: [],
          ),
          SourceSummary(
            id: 3,
            name: 'Disney+',
            type: SourceType.purchase,
            logo100px: '',
            regions: [],
          ),
          SourceSummary(
            id: 4,
            name: 'HBO',
            type: SourceType.purchase,
            logo100px: '',
            regions: [],
          ),
          SourceSummary(
            id: 5,
            name: 'Amazon Prime',
            type: SourceType.sub,
            logo100px: '',
            regions: [],
          ),
        ],
      );
    });
  }
}
