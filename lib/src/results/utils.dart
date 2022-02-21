import '../results.dart';

///
///
List<MFLocationComponent>? toListLocationComponent(Object? json,
    {bool nullable = true}) {
  if (json == null || json is! List<dynamic>) {
    return nullable ? null : <MFLocationComponent>[];
  }

  final locations = <MFLocationComponent>[];
  for (final jsonLocation in json) {
    final location = MFLocationComponent.fromJson(jsonLocation);
    if (location != null) {
      locations.add(location);
    }
  }

  return locations.isNotEmpty ? locations : (nullable ? null : locations);
}

///
///
///
List<MFPlaceAddressComponentResult>? toListPlaceAddressComponent(Object? json) {
  if (json == null || json is! List<dynamic>) {
    return null;
  }

  final addressComponents = <MFPlaceAddressComponentResult>[];

  for (final jsonComponent in json) {
    final addressComponent = PlaceAddressComponentResult.fromMap(jsonComponent);
    if (addressComponent != null) {
      addressComponents.add(addressComponent);
    }
  }

  return addressComponents.isNotEmpty ? addressComponents : null;
}

///
///
///
List<MFRouteStepResult>? toListRouteStep(Object? json) {
  if (json == null || json is! List<dynamic>) {
    return null;
  }

  final steps = <MFRouteStepResult>[];
  for (final jsonStep in json) {
    final step = RouteStepResult.fromMap(jsonStep);
    if (step != null) {
      steps.add(step);
    }
  }

  return steps.isNotEmpty ? steps : null;
}

///
///
///
List<MFRouteLegResult>? toListRouteLeg(Object? json, {bool nullable = true}) {
  if (json == null || json is! List<dynamic>) {
    return nullable ? null : <MFRouteLegResult>[];
  }

  final legs = <MFRouteLegResult>[];
  for (final jsonLeg in json) {
    final leg = RouteLegResult.fromMap(jsonLeg);
    if (leg != null) {
      legs.add(leg);
    }
  }

  return legs.isNotEmpty ? legs : (nullable ? null : legs);
}

///
///
List<MFDistanceMatrixElementResult>? toListDistanceMatrixElement(Object? json,
    {bool nullable = true}) {
  if (json == null || json is! List<dynamic>) {
    return nullable ? null : <MFDistanceMatrixElementResult>[];
  }

  final elements = <MFDistanceMatrixElementResult>[];
  for (final jsonElement in json) {
    final element = DistanceMatrixElementResult.fromMap(jsonElement);
    if (element != null) {
      elements.add(element);
    }
  }

  return elements.isNotEmpty ? elements : (nullable ? null : elements);
}

///
///
List<MFDistanceMatrixRowResult>? toListDistanceMatrixRow(Object? json,
    {bool nullable = true}) {
  if (json == null || json is! List<dynamic>) {
    return nullable ? null : <MFDistanceMatrixRowResult>[];
  }

  final rows = <MFDistanceMatrixRowResult>[];
  for (final jsonRow in json) {
    final row = DistanceMatrixRowResult.fromMap(jsonRow);
    if (row != null) {
      rows.add(row);
    }
  }

  return rows.isNotEmpty ? rows : (nullable ? null : rows);
}

///
///
List<MFRouteResult>? toListRoute(Object? json, {bool nullable = true}) {
  if (json == null || json is! List<dynamic>) {
    return nullable ? null : <MFRouteResult>[];
  }

  final routes = <MFRouteResult>[];
  for (final jsonRoute in json) {
    final route = RouteResult.fromMap(jsonRoute);
    if (route != null) {
      routes.add(route);
    }
  }

  return routes.isNotEmpty ? routes : (nullable ? null : routes);
}

///
///
MFTravelMode toTravelMode(Object? json) {
  if (json != null && json is String) {
    switch (json) {
      case 'car':
        return MFTravelMode.car;
      case 'bike':
        return MFTravelMode.bike;
      case 'foot':
        return MFTravelMode.foot;
      case 'motorcycle':
        return MFTravelMode.motorcycle;
    }
  }

  return MFTravelMode.car;
}
