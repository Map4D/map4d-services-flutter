part of 'services.dart';

class MFPlacesService {

  /// Place detail
  Future<Map<String, dynamic>> getPlaceDetail(String id) async {
    final rs = await _ServicesChannel.invokeService('place#detail', <String, Object>{
      'id': id
    });
    return rs!;
  }

  /// Text search
  Future<Map<String, dynamic>> getPlacesByTextSearch(
    String text, {
    List<String>? types,
    DateTime? datetime,
    MFLocationComponent? location
  }) async {
    final Map<String, Object> data = <String, Object>{
      'text': text
    };

    if (types != null) {
      data['types'] = types;
    }
    if (datetime != null) {
      data['datetime'] = datetime.millisecondsSinceEpoch;
    }
    if (location != null) {
      data['location'] = location.toJson();
    }

    return (await _ServicesChannel.invokeService('place#text-search', data))!;
  }

  /// Nearby search
  Future<Map<String, dynamic>> getPlacesByNearbySearch(
    MFLocationComponent location,
    int radius, {
      String? text,
      List<String>? types,
      List<String>? tags,
      DateTime? datetime,
  }) async {
    final Map<String, Object> data = <String, Object>{
      'location': location.toJson(),
      'radius': radius,
    };

    if (text != null) {
      data['text'] = text;
    }
    if (types != null) {
      data['types'] = types;
    }
    if (tags != null) {
      data['tags'] = tags;
    }
    if (datetime != null) {
      data['datetime'] = datetime.millisecondsSinceEpoch;
    }

    return (await _ServicesChannel.invokeService('place#nearby-search', data))!;
  }

  /// Viewbox search
  Future<Map<String, dynamic>> getPlacesByViewboxSearch(
    MFViewboxComponent viewbox, {
      String? text,
      List<String>? types,
      List<String>? tags,
      DateTime? datetime,
  }) async {
    final Map<String, Object> data = <String, Object>{
      'viewbox': viewbox.toJson(),
    };

    if (text != null) {
      data['text'] = text;
    }
    if (types != null) {
      data['types'] = types;
    }
    if (tags != null) {
      data['tags'] = tags;
    }
    if (datetime != null) {
      data['datetime'] = datetime.millisecondsSinceEpoch;
    }

    return (await _ServicesChannel.invokeService('place#viewbox-search', data))!;
  }

  /// Auto suggest
  Future<Map<String, dynamic>> getPlacesSuggestion(
    String text, {
      MFLocationComponent? location,
      bool acronym = false
  }) async {
    final Map<String, Object> data = <String, Object>{
      'text': text,
      'acronym': acronym,
    };

    if (location != null) {
      data['location'] = location.toJson();
    }

    return (await _ServicesChannel.invokeService('place#autosuggest', data))!;
  }

  /// Geocode
  Future<Map<String, dynamic>> getGeocode({
    MFLocationComponent? location,
    String? address,
    MFViewboxComponent? viewbox
  }) async {
    final Map<String, Object> data = <String, Object>{};

    if (location != null) {
      data['location'] = location.toJson();
    }
    if (address != null) {
      data['address'] = address;
    }
    if (viewbox != null) {
      data['viewbox'] = viewbox.toJson();
    }

    return (await _ServicesChannel.invokeService('geocode#geocode', data))!;
  }
}