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
class MFRouteETAResultImpl implements MFRouteETAResult {
  final MFLocationComponent _location;
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;
  final String _encodedPolyline;

  MFRouteETAResultImpl._(this._location, this._distance, this._duration, this._encodedPolyline);

  static MFRouteETAResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    String? alias = json['alias'];
    final location = MFLocationComponent.fromJson(json['location'])!;

    return MFRouteETAResultImpl._(
      alias == null ? location : MFLocationComponent(latitude: location.latitude, longitude: location.longitude, alias: alias),
      MFRouteDescriptionResultImpl.fromMap(json['distance'])!,
      MFRouteDescriptionResultImpl.fromMap(json['duration'])!,
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