import '../results.dart';

abstract class MFGeocodeResult {
  /// Place ID.
  String? get id;

  /// Place geographical location.
  MFLocationComponent get location;

  /// Place name.
  String get name;

  /// Place address.
  String get address;

  /// List of type of the place.
  List<String> get types;

  /// List of administrative units of the place in that location.
  List<MFPlaceAddressComponentResult>? get addressComponents;
}

class GeocodeResult implements MFGeocodeResult {
  final String? _id;
  final MFLocationComponent _location;
  final String _name;
  final String _address;
  final List<String> _types;
  final List<MFPlaceAddressComponentResult>? _addressComponents;

  GeocodeResult._(this._id, this._location, this._name, this._address,
      this._types, this._addressComponents);

  static GeocodeResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return GeocodeResult._(
      json['id'],
      MFLocationComponent.fromJson(json['location'])!,
      json['name'],
      json['address'],
      (json['types'] as List<dynamic>).cast<String>(),
      toListPlaceAddressComponent(json['addressComponents']),
    );
  }

  @override
  String get address => _address;

  @override
  List<MFPlaceAddressComponentResult>? get addressComponents =>
      _addressComponents;

  @override
  String? get id => _id;

  @override
  MFLocationComponent get location => _location;

  @override
  String get name => _name;

  @override
  List<String> get types => _types;
}
