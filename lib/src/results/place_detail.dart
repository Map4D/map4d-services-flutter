import '../results.dart';

abstract class MFPlaceDetailResult {
  /// Place ID.
  String get id;

  /// Place name.
  String get name;

  /// Place address.
  String get address;

  /// Place geographical location.
  MFLocationComponent get location;

  /// List of type of the place.
  List<String> get types;

  /// Place description.
  String? get description;

  /// List of tag of the place.
  List<String>? get tags;

  /// List of metadata of the place.
  List<MFPlaceMetadataResult>? get metadatas;

  /// List of photo of the place.
  List<MFPlacePhotoResult>? get photos;

  /// List of administrative units of the place in that location.
  List<MFPlaceAddressComponentResult>? get addressComponents;

  /// The object of that place (e.g. what building it belongs to - the building is the object).
  String? get objectId;
}

class PlaceDetailResult implements MFPlaceDetailResult {
  final String _id;
  final String _name;
  final String _address;
  final MFLocationComponent _location;
  final List<String> _types;

  final String? _description;
  final List<String>? _tags;
  final List<MFPlaceMetadataResult>? _metadatas;
  final List<MFPlacePhotoResult>? _photos;
  final List<MFPlaceAddressComponentResult>? _addressComponents;
  final String? _objectId;

  PlaceDetailResult._(
    this._id,
    this._name,
    this._address,
    this._location,
    this._types,
    this._description,
    this._tags,
    this._metadatas,
    this._photos,
    this._addressComponents,
    this._objectId,
  );

  static PlaceDetailResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    final metadatas = <MFPlaceMetadataResult>[];
    final metadatasJson = json['metadata'] as List<dynamic>?;
    if (metadatasJson != null) {
      for (final metadataJson in metadatasJson) {
        final metadata = PlaceMetadataResult.fromMap(metadataJson);
        if (metadata != null) {
          metadatas.add(metadata);
        }
      }
    }

    final photos = <MFPlacePhotoResult>[];
    final photosJson = json['photos'] as List<dynamic>?;
    if (photosJson != null) {
      for (final photoJson in photosJson) {
        final photo = PlacePhotoResult.fromMap(photoJson);
        if (photo != null) {
          photos.add(photo);
        }
      }
    }

    return PlaceDetailResult._(
      json['id'],
      json['name'],
      json['address'],
      MFLocationComponent.fromJson(json['location'])!,
      (json['types'] as List<dynamic>).cast<String>(),
      json['description'],
      (json['tags'] as List<dynamic>?)?.cast<String>(),
      metadatas.isNotEmpty ? metadatas : null,
      photos.isNotEmpty ? photos : null,
      toListPlaceAddressComponent(json['addressComponents']),
      json['objectId'],
    );
  }

  @override
  String get address => _address;

  @override
  String get id => _id;

  @override
  MFLocationComponent get location => _location;

  @override
  String get name => _name;

  @override
  List<String> get types => _types;

  @override
  String? get description => _description;

  @override
  List<String>? get tags => _tags;

  @override
  List<MFPlaceMetadataResult>? get metadatas => _metadatas;

  @override
  List<MFPlacePhotoResult>? get photos => _photos;

  @override
  List<MFPlaceAddressComponentResult>? get addressComponents =>
      _addressComponents;

  @override
  String? get objectId => _objectId;
}
