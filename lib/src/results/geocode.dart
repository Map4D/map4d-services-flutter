import '../results.dart';

abstract class MFGeocodeResult {
  String? get id;
  MFLocationComponent get location;
  String get name;
  String get address;
  List<String> get types;
  List<MFPlaceAddressComponentResult>? get addressComponents;
}

class MFGeocodeResultImpl implements MFGeocodeResult {
  final String? _id;
  final MFLocationComponent _location;
  final String _name;
  final String _address;
  final List<String> _types;
  final List<MFPlaceAddressComponentResult>? _addressComponents;

  MFGeocodeResultImpl._(this._id, this._location, this._name, this._address, this._types, this._addressComponents);

  static MFGeocodeResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFGeocodeResultImpl._(
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
  List<MFPlaceAddressComponentResult>? get addressComponents => _addressComponents;

  @override
  String? get id => _id;

  @override
  MFLocationComponent get location => _location;

  @override
  String get name => _name;

  @override
  List<String> get types => _types;
}