import '../results.dart';

///
///
abstract class MFDistanceMatrixElementResult {
  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;
  // String? get status;
}

///
///
class DistanceMatrixElementResult implements MFDistanceMatrixElementResult {
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;

  DistanceMatrixElementResult._(this._distance, this._duration);

  static DistanceMatrixElementResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return DistanceMatrixElementResult._(
      RouteDescriptionResult.fromMap(json['distance'])!,
      RouteDescriptionResult.fromMap(json['duration'])!,
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;
}