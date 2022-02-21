import '../results.dart';

abstract class MFSuggestionResult {
  /// Place ID.
  String? get id;

  /// Place name.
  String get name;

  /// Place address.
  String get address;

  /// Place geographical location.
  MFLocationComponent get location;

  /// List of type of the place.
  List<String> get types;
}

class SuggestionResult implements MFSuggestionResult {
  final String? _id;
  final String _name;
  final String _address;
  final MFLocationComponent _location;
  final List<String> _types;

  SuggestionResult._(
      this._id, this._name, this._address, this._location, this._types);

  static SuggestionResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return SuggestionResult._(
        json['id'],
        json['name'],
        json['address'],
        MFLocationComponent.fromJson(json['location'])!,
        (json['types'] as List<dynamic>).cast<String>());
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
