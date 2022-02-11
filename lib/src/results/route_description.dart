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
class MFRouteDescriptionResultImpl implements MFRouteDescriptionResult {
  final String _text;
  final double _value;

  MFRouteDescriptionResultImpl._(this._text, this._value);

  static MFRouteDescriptionResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFRouteDescriptionResultImpl._(json['text'], json['value']);
  }

  @override
  String get text => _text;

  @override
  double get value => _value;

}