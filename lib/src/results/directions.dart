import '../results.dart';

abstract class MFDirectionsResult {
  /// List of directions.
  List<MFRouteResult>? get routes;
}

///
///
class DirectionsResult implements MFDirectionsResult {
  final List<MFRouteResult>? _routes;

  DirectionsResult._(this._routes);

  static MFDirectionsResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return DirectionsResult._(toListRoute(json['routes']));
  }

  @override
  List<MFRouteResult>? get routes => _routes;
}
