import '../results.dart';

///
///
abstract class MFRouteETAResult {
  MFLocationComponent get location;
  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;
  String get encodedPolyline;

  //List<MFLocationComponent> get polyline;
}

///
///
class RouteETAResult implements MFRouteETAResult {
  final MFLocationComponent _location;
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;
  final String _encodedPolyline;

  RouteETAResult._(
      this._location, this._distance, this._duration, this._encodedPolyline);

  static RouteETAResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    String? alias = json['alias'];
    final location = MFLocationComponent.fromJson(json['location'])!;

    return RouteETAResult._(
      alias == null
          ? location
          : MFLocationComponent(
              latitude: location.latitude,
              longitude: location.longitude,
              alias: alias),
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
  MFLocationComponent get location => _location;
}
