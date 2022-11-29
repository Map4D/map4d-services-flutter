import '../results.dart';

///
///
///
abstract class MFRouteResult {
  List<MFRouteLegResult> get legs;
  String get summary;
  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;
  List<MFLocationComponent> get snappedLocations; /* snappedWaypoints */

  String get encodedPolyline; /* overviewPolyline */
  List<MFLocationComponent> get polyline;
}

///
///
///
class RouteResult implements MFRouteResult {
  final List<MFRouteLegResult> _legs;
  final String _summary;
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;
  final List<MFLocationComponent> _snappedLocations;
  final String _encodedPolyline;
  List<MFLocationComponent>? _polyline;

  RouteResult._(this._legs, this._encodedPolyline, this._summary,
      this._distance, this._duration, this._snappedLocations);

  static RouteResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return RouteResult._(
      toListRouteLeg(json['legs'], nullable: false)!,
      json['overviewPolyline'],
      json['summary'],
      RouteDescriptionResult.fromMap(json['distance'])!,
      RouteDescriptionResult.fromMap(json['duration'])!,
      toListLocationComponent(json['snappedWaypoints'], nullable: false)!,
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;

  @override
  List<MFRouteLegResult> get legs => _legs;

  @override
  List<MFLocationComponent> get snappedLocations => _snappedLocations;

  @override
  String get summary => _summary;

  @override
  String get encodedPolyline => _encodedPolyline;

  @override
  List<MFLocationComponent> get polyline => _decodePolyline();

  List<MFLocationComponent> _decodePolyline() {
    _polyline ??= decodePolyline(_encodedPolyline);
    return _polyline!;
  }
}
