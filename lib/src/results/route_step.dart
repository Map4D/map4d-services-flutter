import '../results.dart';

///
///
///
abstract class MFRouteStepResult {
  ///
  MFRouteDescriptionResult get distance;

  ///
  MFRouteDescriptionResult get duration;

  ///
  MFLocationComponent get startLocation;

  ///
  MFLocationComponent get endLocation;

  /// HTML instructions
  String get instructions;

  ///
  String get maneuver;

  ///
  String get encodedPolyline; /* polyline */

  ///
  String get streetName;

  /// Travel mode
  MFTravelMode get mode;

  //List<MFLocationComponent> get polyline;
}

///
///
///
class RouteStepResult implements MFRouteStepResult {
  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;

  final MFLocationComponent _startLocation;
  final MFLocationComponent _endLocation;

  final String _instructions;
  final String _maneuver;
  final String _encodedPolyline; /* polyline */
  final String _streetName;
  final MFTravelMode _mode; /* travelMode */

  RouteStepResult._(
    this._distance,
    this._duration,
    this._startLocation,
    this._endLocation,
    this._instructions,
    this._maneuver,
    this._encodedPolyline,
    this._streetName,
    this._mode,
  );

  static RouteStepResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return RouteStepResult._(
      RouteDescriptionResult.fromMap(json['distance'])!,
      RouteDescriptionResult.fromMap(json['duration'])!,
      MFLocationComponent.fromJson(json['startLocation'])!,
      MFLocationComponent.fromJson(json['endLocation'])!,
      json['htmlInstructions'],
      json['maneuver'],
      json['polyline'],
      json['streetName'],
      toTravelMode(json['travelMode']),
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;

  @override
  String get encodedPolyline => _encodedPolyline;

  @override
  MFLocationComponent get endLocation => _endLocation;

  @override
  String get instructions => _instructions;

  @override
  String get maneuver => _maneuver;

  @override
  MFTravelMode get mode => _mode;

  @override
  MFLocationComponent get startLocation => _startLocation;

  @override
  String get streetName => _streetName;
}