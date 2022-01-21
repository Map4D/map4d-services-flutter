Object locationsToJson(List<MFLocationComponent> locations) {
  final List<Object> result = <Object>[];
  for (final MFLocationComponent location in locations) {
    result.add(location.toJson());
  }
  return result;
}

enum MFTravelMode {
  car,
  bike,
  foot,
  motorcycle,
}

enum MFLanguageResult {
  en,
  vi,
}

enum MFRouteWeighting {
  shortest,
  fastest,
  balance,
}

enum MFRouteType {
  motorway,
  trunk,
  ferry,
  bridge,
  tunnel,
}

class MFRouteRestriction {

  final MFLocationComponent? _location;

  final int? _radius;

  final MFViewboxComponent? _viewbox;

  final List<MFLocationComponent>? _path;

  final List<MFRouteType>? _types;

  MFRouteRestriction._(this._location, this._radius, this._viewbox, this._path, this._types);

  static MFRouteRestriction restrictLocation(MFLocationComponent location, {List<MFRouteType>? types}) {
    return MFRouteRestriction._(location, null, null, null, types);
  }

  static MFRouteRestriction restrictCircleArea(MFLocationComponent center, int radius, {List<MFRouteType>? types}) {
    return MFRouteRestriction._(center, radius, null, null, types);
  }

  static MFRouteRestriction restrictCoordinateBounds(MFViewboxComponent viewbox, {List<MFRouteType>? types}) {
    return MFRouteRestriction._(null, null, viewbox, null, types);
  }

  static MFRouteRestriction restrictPolygonArea(List<MFLocationComponent> path, {List<MFRouteType>? types}) {
    return MFRouteRestriction._(null, null, null, path, types);
  }

  static MFRouteRestriction restrictRouteTypes(List<MFRouteType>? types) {
    return MFRouteRestriction._(null, null, null, null, types);
  }

  Object toJson() {
    final Map<String, Object> json = <String, Object>{};
    if (_location != null) {
      json['location'] = _location!.toJson();
    }

    if (_radius != null) {
      json['radius'] = _radius!;
    }

    if (_viewbox != null) {
      json['viewbox'] = _viewbox!.toJson();
    }

    if (_path != null) {
      json['path'] = locationsToJson(_path!);
    }

    if (_types != null) {
      json['types'] = _types!.map((e) => e.index);
    }

    return json;
  }
}

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
