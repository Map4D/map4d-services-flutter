part of 'services.dart';

class MFPlacesService {

  /// Place detail
  Future<MFPlaceDetailResult> getPlaceDetail(String id) async {
    final response = await _ServicesChannel.invokeService('place#detail', <String, Object>{
      'id': id
    });
    validateResponse(response);
    return PlaceDetailResult.fromMap(response!['result'])!;
  }

  /// Text search
  Future<List<MFPlaceResult>> getPlacesByTextSearch(
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

    final response = await _ServicesChannel.invokeService('place#text-search', data);
    validateResponse(response);

    return toListPlace(response!['result']);
  }

  /// Nearby search
  Future<List<MFPlaceResult>> getPlacesByNearbySearch(
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

    final response = await _ServicesChannel.invokeService('place#nearby-search', data);
    validateResponse(response);

    return toListPlace(response!['result']);
  }

  /// Viewbox search
  Future<List<MFPlaceResult>> getPlacesByViewboxSearch(
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

    final response = await _ServicesChannel.invokeService('place#viewbox-search', data);
    validateResponse(response);

    return toListPlace(response!['result']);
  }

  /// Auto suggest
  Future<List<MFSuggestionResult>> getPlacesSuggestion(
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

    final response = await _ServicesChannel.invokeService('place#autosuggest', data);
    validateResponse(response);

    return toListSuggestion(response!['result']);
  }

  /// Geocode
  Future<List<MFGeocodeResult>> getGeocode({
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

    final response = await _ServicesChannel.invokeService('geocode#geocode', data);
    validateResponse(response);

    return toListGeocode(response!['result']);
  }
}