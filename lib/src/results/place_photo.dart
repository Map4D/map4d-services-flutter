abstract class MFPlacePhotoResult {
  String get url;
  String get name;
}

class MFPlacePhotoResultImpl implements MFPlacePhotoResult {
  final String _url;
  final String _name;

  MFPlacePhotoResultImpl._(this._name, this._url);

  static MFPlacePhotoResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFPlacePhotoResultImpl._(json['name'], json['url']);
  }

  @override
  String get name => _name;

  @override
  String get url => _url;

}