abstract class MFPlaceMetadataResult {
  String get id;
  String get name;
  String get type;
  String get content;
  int get order;
}

class MFPlaceMetadataResultImpl implements MFPlaceMetadataResult {
  final String _id;
  final String _name;
  final String _type;
  final String _content;
  final int _order;

  MFPlaceMetadataResultImpl._(this._id, this._name, this._type, this._content, this._order);

  static MFPlaceMetadataResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFPlaceMetadataResultImpl._(json['id'], json['name'], json['type'], json['content'], json['order']);
  }

  @override
  String get content => _content;

  @override
  String get id => _id;

  @override
  String get name => _name;

  @override
  int get order => _order;

  @override
  String get type => _type;

}