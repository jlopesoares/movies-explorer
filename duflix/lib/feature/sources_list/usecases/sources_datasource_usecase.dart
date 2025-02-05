import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';
import 'package:duflix/api/gen/watchmode_api.swagger.dart';

abstract class SourcesDatasourceUsecase {
  Future<List<SourceSummary>> getSources();
}
