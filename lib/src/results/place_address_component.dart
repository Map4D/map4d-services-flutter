abstract class MFPlaceAddressComponentResult {
  String get name;
  List<String> get types;
}


class MFPlaceAddressComponentResultImp implements MFPlaceAddressComponentResult {
  final String _name;
  final List<String> _types;

  MFPlaceAddressComponentResultImp._(this._name, this._types);

  static MFPlaceAddressComponentResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFPlaceAddressComponentResultImp._(
      json['name'],
      (json['types'] as List<dynamic>).cast<String>(),
    );
  }

  @override
  String get name => _name;

  @override
  List<String> get types => _types;
}