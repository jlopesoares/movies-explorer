import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/feature/sources_list/data/usecases/sources_datasource_usecase.dart';
import 'package:duflix/feature/sources_list/data/usecases/sources_repository_usecase.dart';
import 'package:duflix/feature/sources_list/domain/sources_rail.dart';

class SourcesRepository implements SourcesRepositoryUsecase {
  const SourcesRepository(this.datasource);

  final SourcesDatasourceUsecase datasource;

  @override
  Future<List<SourcesRail>> getSources() async {
    final List<SourcesRail> sourcesRails = [];

    final sourcesMap = <SourceType, SourcesRail>{};

    final serviceSources = await datasource.getSources();

    for (final source in serviceSources) {
      if (sourcesMap.containsKey(source.type)) {
        sourcesMap[source.type]!.sources.add(source);
      } else {
        sourcesMap[source.type] = SourcesRail(
          sources: [source],
          type: source.type,
        );
      }
    }

    sourcesMap.forEach((key, value) {
      sourcesRails.add(value);
    });

    return sourcesRails;
  }
}
