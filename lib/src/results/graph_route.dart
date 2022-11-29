import '../results.dart';

///
///
abstract class MFGraphRouteResult {
  String get id;
  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;
  String get encodedPolyline; /* polyline */
  List<MFLocationComponent> get polyline;
}

///
///
class GraphRouteResult implements MFGraphRouteResult {
  final String _id;
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;
  final String _encodedPolyline;
  List<MFLocationComponent>? _polyline;

  GraphRouteResult._(
      this._id, this._distance, this._duration, this._encodedPolyline);

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
  String get id => _id;

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;

  @override
  String get encodedPolyline => _encodedPolyline;

  @override
  List<MFLocationComponent> get polyline => _decodePolyline();

  List<MFLocationComponent> _decodePolyline() {
    _polyline ??= decodePolyline(_encodedPolyline);
    return _polyline!;
  }
}
