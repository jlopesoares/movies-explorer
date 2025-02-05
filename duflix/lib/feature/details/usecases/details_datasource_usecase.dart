import 'package:duflix/api/gen/watchmode_api.models.swagger.dart';

abstract class DetailsDatasourceUsecase {
  Future<TitleDetails?> getTitleDetails(int titleId);
}
