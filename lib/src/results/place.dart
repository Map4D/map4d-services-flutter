import '../results.dart';

abstract class MFPlaceResult {
  String? get id;
  String get name;
  String get address;
  MFLocationComponent get location;
  List<String> get types;
}

class PlaceResult implements MFPlaceResult {
  final String? _id;
  final String _name;
  final String _address;
  final MFLocationComponent _location;
  final List<String> _types;

  PlaceResult._(this._id, this._name, this._address, this._location, this._types);

  static PlaceResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }
    
    return PlaceResult._(
      json['id'],
      json['name'],
      json['address'],
      MFLocationComponent.fromJson(json['location'])!,
      (json['types'] as List<dynamic>).cast<String>()
    );
  }

  @override
  String get address => _address;

  @override
  String? get id => _id;

  @override
  MFLocationComponent get location => _location;

  @override
  String get name => _name;

  @override
  List<String> get types => _types;
}