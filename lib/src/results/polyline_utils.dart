import '../components.dart';
import 'dart:math' as math show pow;

///
///
List<MFLocationComponent> decodePolyline(String polyline, {int accuracyExponent = 5}) {
  final accuracyMultiplier = math.pow(10, accuracyExponent);
  final List<MFLocationComponent> coordinates = [];

  int index = 0;
  int lat = 0;
  int lng = 0;

  while (index < polyline.length) {
    int char;
    int shift = 0;
    int result = 0;

    /// Method for getting **only** `1` coorditane `latitude` or `longitude` at a time
    int getCoordinate() {
      /// Iterating while value is grater or equal of `32-bits` size
      do {
        /// Substract `63` from `codeUnit`.
        char = polyline.codeUnitAt(index++) - 63;

        /// `AND` each `char` with `0x1f` to get 5-bit chunks.
        /// Then `OR` each `char` with `result`.
        /// Then left-shift for `shift` bits
        result |= (char & 0x1f) << shift;
        shift += 5;
      } while (char >= 0x20);

      /// Inversion of both:
      ///
      ///  * Left-shift the `value` for one bit
      ///  * Inversion `value` if it is negative
      final value = result >> 1;
      final coordinateChange =
          (result & 1) != 0 ? (~BigInt.from(value)).toInt() : value;

      /// It is needed to clear `shift` and `result` for next coordinate.
      shift = result = 0;

      return coordinateChange;
    }

    lat += getCoordinate();
    lng += getCoordinate();

    coordinates.add(MFLocationComponent(latitude: lat / accuracyMultiplier, longitude: lng / accuracyMultiplier));
  }

  return coordinates;
}
