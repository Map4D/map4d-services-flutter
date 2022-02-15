abstract class MFPlacePhotoResult {
  String get url;
  String get name;
}

class PlacePhotoResult implements MFPlacePhotoResult {
  final String _url;
  final String _name;

  PlacePhotoResult._(this._name, this._url);

  static MFPlacePhotoResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return PlacePhotoResult._(json['name'], json['url']);
  }

  @override
  String get name => _name;

  @override
  String get url => _url;

}