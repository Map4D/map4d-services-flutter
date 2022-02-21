import '../components.dart';

class MFRouteRestriction {
  final MFLocationComponent? _location;

  final int? _radius;

  final MFViewboxComponent? _viewbox;

  final List<MFLocationComponent>? _path;

  final List<MFRouteType>? _types;

  MFRouteRestriction._(
      this._location, this._radius, this._viewbox, this._path, this._types);

  /// Initialize a MFRouteRestriction with restrict one point and route types.
  static MFRouteRestriction restrictLocation(MFLocationComponent location,
      {List<MFRouteType>? types}) {
    return MFRouteRestriction._(location, null, null, null, types);
  }

  /// Initialize a MFRouteRestriction with restrict circle area and route types.
  static MFRouteRestriction restrictCircleArea(
      MFLocationComponent center, int radius,
      {List<MFRouteType>? types}) {
    return MFRouteRestriction._(center, radius, null, null, types);
  }

  /// Initialize a MFRouteRestriction with restrict rectangle area and route types.
  static MFRouteRestriction restrictCoordinateBounds(MFViewboxComponent viewbox,
      {List<MFRouteType>? types}) {
    return MFRouteRestriction._(null, null, viewbox, null, types);
  }

  /// Initialize a MFRouteRestriction with restrict polygon area and route types.
  static MFRouteRestriction restrictPolygonArea(List<MFLocationComponent> path,
      {List<MFRouteType>? types}) {
    return MFRouteRestriction._(null, null, null, path, types);
  }

  /// Initialize a MFRouteRestriction with restrict only route types.
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
      final types = <int>[];
      for (final type in _types!) {
        types.add(type.index);
      }
      json['types'] = types;
    }

    return json;
  }
}
