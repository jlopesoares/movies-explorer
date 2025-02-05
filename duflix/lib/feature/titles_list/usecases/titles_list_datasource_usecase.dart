import 'package:duflix/api/gen/watchmode_api.swagger.dart';

abstract class TitlesListDatasourceUsecase {
  Future<TitlesResult> listTitles(int sourceId, int page);
}
