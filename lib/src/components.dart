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
}

class MFViewboxComponent {

  final MFLocationComponent southwest;
  final MFLocationComponent northeast;

  const MFViewboxComponent({
    required this.southwest,
    required this.northeast
  });

  Object toJson() {
    return <String, Object>{
      'southwest': southwest.toJson(),
      'northeast': northeast.toJson(),
    };
  }
}
