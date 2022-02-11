import '../results.dart';

///
///
abstract class MFDirectionsResult {
  List<MFRouteResult>? get routes;
}

///
///
class MFDirectionsResultImpl implements MFDirectionsResult {
  final List<MFRouteResult>? _routes;

  MFDirectionsResultImpl._(this._routes);

  static MFDirectionsResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFDirectionsResultImpl._(toListRoute(json['routes']));
  }

  @override
  List<MFRouteResult>? get routes => _routes;
}