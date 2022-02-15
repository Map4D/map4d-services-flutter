///
///
class MFLocationComponent {

  final double latitude;
  final double longitude;
  final String? alias;

  const MFLocationComponent({
    required this.latitude,
    required this.longitude,
    this.alias
  });

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

  static MFLocationComponent? fromJson(Object? json) {
    if (json != null) {
      if (json is Map<dynamic, dynamic>) {
        return MFLocationComponent(latitude: json['lat'].toDouble(), longitude: json['lng'].toDouble());
      }
      else if (json is String) {
        final coor = json.split(',');
        if (coor.length == 2) {
          return MFLocationComponent(latitude: double.parse(coor[0]), longitude: double.parse(coor[1]));
        }
      }
    }
    return null;
  }
}
