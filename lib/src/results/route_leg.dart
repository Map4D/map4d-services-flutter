import '../results.dart';

///
///
///
abstract class MFRouteLegResult {
  List<MFRouteStepResult> get steps;

  MFRouteDescriptionResult get distance;
  MFRouteDescriptionResult get duration;

  String? get startAddress;
  String? get endAddress;

  MFLocationComponent get startLocation;
  MFLocationComponent get endLocation;
}

///
///
///
class RouteLegResult implements MFRouteLegResult {
  final List<MFRouteStepResult> _steps;

  final MFRouteDescriptionResult _distance;
  final MFRouteDescriptionResult _duration;

  final String? _startAddress;
  final String? _endAddress;

  final MFLocationComponent _startLocation;
  final MFLocationComponent _endLocation;

  RouteLegResult._(
      this._steps,
      this._distance,
      this._duration,
      this._startAddress,
      this._endAddress,
      this._startLocation,
      this._endLocation);

  static RouteLegResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return RouteLegResult._(
      toListRouteStep(json['steps'])!,
      RouteDescriptionResult.fromMap(json['distance'])!,
      RouteDescriptionResult.fromMap(json['duration'])!,
      json['startAddress'],
      json['endAddress'],
      MFLocationComponent.fromJson(json['startLocation'])!,
      MFLocationComponent.fromJson(json['endLocation'])!,
    );
  }

  @override
  MFRouteDescriptionResult get distance => _distance;

  @override
  MFRouteDescriptionResult get duration => _duration;

  @override
  String? get endAddress => _endAddress;

  @override
  MFLocationComponent get endLocation => _endLocation;

  @override
  String? get startAddress => _startAddress;

  @override
  MFLocationComponent get startLocation => _startLocation;

  @override
  List<MFRouteStepResult> get steps => _steps;
}
