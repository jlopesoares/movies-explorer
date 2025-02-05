import 'package:duflix/feature/sources_list/domain/sources_rail.dart';

abstract class SourcesRepositoryUsecase {
  Future<List<SourcesRail>> getSources();
}
