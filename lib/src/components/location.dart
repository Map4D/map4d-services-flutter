class MFLocationComponent {
  /// The latitude in degrees between -90.0 and 90.0, both inclusive.
  final double latitude;

  /// The longitude in degrees between -180.0 (inclusive) and 180.0 (exclusive).
  final double longitude;

  /// Location alias.
  final String? alias;

  /// Creates a geographical location specified in degrees [latitude],
  /// [longitude] and alias.
  const MFLocationComponent(
      {required this.latitude, required this.longitude, this.alias});

  Object toJson() {
    final Map<String, Object> json = <String, Object>{
      'lat': latitude,
      'lng': longitude,
    };

    if (alias != null) {
      json['alias'] = alias!;
    }
    return json;
  }

  /// Initialize a MFLocationComponent from json object.
  static MFLocationComponent? fromJson(Object? json) {
    if (json != null) {
      if (json is Map<dynamic, dynamic>) {
        return MFLocationComponent(
            latitude: json['lat'].toDouble(),
            longitude: json['lng'].toDouble());
      } else if (json is String) {
        final coor = json.split(',');
        if (coor.length == 2) {
          return MFLocationComponent(
              latitude: double.parse(coor[0]),
              longitude: double.parse(coor[1]));
        }
      }
    }
    return null;
  }
}
