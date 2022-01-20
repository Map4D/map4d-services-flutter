part of 'services.dart';

class MFRoutesService {

  Future<Map<String, dynamic>> getDirections(
    MFLocationComponent origin,
    MFLocationComponent destination, {
      List<MFLocationComponent>? waypoints,
      MFTravelMode mode = MFTravelMode.car,
      MFRouteWeighting weighting = MFRouteWeighting.fastest,
      MFLanguageResult language = MFLanguageResult.vi,
      MFRouteRestriction? avoid,
  }) async {
    final Map<String, Object> data = <String, Object>{
      'origin': origin.toJson(),
      'destination': destination.toJson(),
      'mode': mode.index,
      'weighting': weighting.index,
      'language': language.index,
    };

    if (waypoints != null) {
      data['points'] = locationsToJson(waypoints);
    }
    if (avoid != null) {
      data['avoid'] = avoid.toJson();
    }

    return (await _ServicesChannel.invokeService('route#route', data))!;
  }

  Future<Map<String, dynamic>> getRouteETA(
    List<MFLocationComponent> origins,
    MFLocationComponent destination, {
      MFTravelMode mode = MFTravelMode.car,
      MFRouteWeighting weighting = MFRouteWeighting.fastest,
      MFLanguageResult language = MFLanguageResult.vi,
      MFRouteRestriction? avoid,
  }) async {
    final Map<String, Object> data = <String, Object>{
      'origins': locationsToJson(origins),
      'destination': destination.toJson(),
      'mode': mode.index,
      'weighting': weighting.index,
      'language': language.index,
    };

    if (avoid != null) {
      data['avoid'] = avoid.toJson();
    }

    return (await _ServicesChannel.invokeService('route#eta', data))!;
  }

  Future<Map<String, dynamic>> getDistanceMatrix(
    List<MFLocationComponent> origins,
    List<MFLocationComponent> destinations, {
      MFTravelMode mode = MFTravelMode.car,
      MFRouteWeighting weighting = MFRouteWeighting.fastest,
      MFLanguageResult language = MFLanguageResult.vi,
      MFRouteRestriction? avoid,
    }
  ) async {
    final Map<String, Object> data = <String, Object>{
      'origins': locationsToJson(origins),
      'destinations': locationsToJson(destinations),
      'mode': mode.index,
      'weighting': weighting.index,
      'language': language.index,
    };

    if (avoid != null) {
      data['avoid'] = avoid.toJson();
    }

    return (await _ServicesChannel.invokeService('route#matrix', data))!;
  }

  Future<Map<String, dynamic>> getRouteGraph(
    List<MFLocationComponent> points, {
      MFTravelMode mode = MFTravelMode.car,
      MFRouteWeighting weighting = MFRouteWeighting.fastest,
      MFLanguageResult language = MFLanguageResult.vi,
      MFRouteRestriction? avoid,
    }
  ) async {
    final Map<String, Object> data = <String, Object>{
      'points': locationsToJson(points),
      'mode': mode.index,
      'weighting': weighting.index,
      'language': language.index,
    };

    if (avoid != null) {
      data['avoid'] = avoid.toJson();
    }

    return (await _ServicesChannel.invokeService('route#graph', data))!;
  }
}