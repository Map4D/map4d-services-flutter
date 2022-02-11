import '../results.dart';

List<MFPlaceAddressComponentResult>? toListPlaceAddressComponent(Object? json) {
  if (json == null || json is! List<dynamic>) {
    return null;
  }

  final addressComponents = <MFPlaceAddressComponentResult>[];

  for (final jsonComponent in json) {
    final addressComponent = MFPlaceAddressComponentResultImp.fromMap(jsonComponent);
    if (addressComponent != null) {
      addressComponents.add(addressComponent);
    }
  }

  return addressComponents.isNotEmpty ? addressComponents : null;
}