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
class MFDistanceMatrixElementResultImpl implements MFDistanceMatrixElementResult {
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;

  MFDistanceMatrixElementResultImpl._(this._distance, this._duration);

  static MFDistanceMatrixElementResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFDistanceMatrixElementResultImpl._(
      MFRouteDescriptionResultImpl.fromMap(json['distance'])!,
      MFRouteDescriptionResultImpl.fromMap(json['duration'])!,
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;
}