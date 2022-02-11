import 'components.dart';

Object locationsToJson(List<MFLocationComponent> locations) {
  final List<Object> result = <Object>[];
  for (final MFLocationComponent location in locations) {
    result.add(location.toJson());
  }
  return result;
}