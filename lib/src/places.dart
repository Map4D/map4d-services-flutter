part of 'services.dart';

class MFPlaceService {

  Future<Map<String, dynamic>> getPlaceDetail(String id) async {
    final rs = await _ServicesChannel.invokeService('place#detail', <String, Object>{
      'id': id
    });
    return rs!;
  }

  Future<Map<String, dynamic>> getPlaceByTextSearch(
    String text, {
    List<String>? types,
    DateTime? datetime,
    MFLocationComponent? location}
  ) async {
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

  //sdk/place/nearby-search
  //sdk/place/viewbox-search
}