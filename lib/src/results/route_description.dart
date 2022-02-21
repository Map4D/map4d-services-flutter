///
///
///
abstract class MFRouteDescriptionResult {
  String get text;
  double get value;
}

///
///
///
class RouteDescriptionResult implements MFRouteDescriptionResult {
  final String _text;
  final double _value;

  RouteDescriptionResult._(this._text, this._value);

  static RouteDescriptionResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return RouteDescriptionResult._(json['text'], json['value'].toDouble());
  }

  @override
  String get text => _text;

  @override
  double get value => _value;
}
