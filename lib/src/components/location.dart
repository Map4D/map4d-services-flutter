import '../components.dart';

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
    if (json != null && json is Map<dynamic, dynamic>) {
      return MFLocationComponent(latitude: json['lat'], longitude: json['lng']);
    }
    return null;
  }
}
