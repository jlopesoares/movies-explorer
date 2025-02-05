import 'package:duflix/api/gen/watchmode_api.swagger.dart';

class SourcesRail {
  const SourcesRail({
    required this.sources,
    required this.type,
  });

  final List<SourceSummary> sources;
  final SourceType type;

  String get title {
    switch (type) {
      case SourceType.free:
        return 'Free';
      case SourceType.purchase:
        return 'Purchase';
      case SourceType.sub:
        return 'Subscription';
      case SourceType.tve:
        return 'TV';
      case SourceType.swaggerGeneratedUnknown:
        return 'Other';
    }
  }
}
