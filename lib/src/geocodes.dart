part of 'services.dart';

class MFGeocodesService {

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