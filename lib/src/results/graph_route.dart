import '../results.dart';

///
///
abstract class MFGraphRouteResult {
  String get id;
  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;
  String get encodedPolyline; /* polyline */

  //List<MFLocationComponent> get polyline;
}

///
///
class GraphRouteResult implements MFGraphRouteResult {
  final String _id;
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;
  final String _encodedPolyline;

  GraphRouteResult._(this._id, this._distance, this._duration, this._encodedPolyline);

  static GraphRouteResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return GraphRouteResult._(
      json['id'],
      RouteDescriptionResult.fromMap(json['distance'])!,
      RouteDescriptionResult.fromMap(json['duration'])!,
      json['polyline'],
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;

  @override
  String get encodedPolyline => _encodedPolyline;

  @override
  String get id => _id;
}