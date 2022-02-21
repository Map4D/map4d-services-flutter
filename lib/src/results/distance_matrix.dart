import '../results.dart';

///
///
abstract class MFDistanceMatrixResult {
  // originAddresses
  // destinationAddresses

  List<MFDistanceMatrixRowResult>? get rows; /* routeRows */
}

///
///
class DistanceMatrixResult implements MFDistanceMatrixResult {
  final List<MFDistanceMatrixRowResult>? _rows;

  DistanceMatrixResult._(this._rows);

  static DistanceMatrixResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return DistanceMatrixResult._(toListDistanceMatrixRow(json['routeRows']));
  }

  @override
  List<MFDistanceMatrixRowResult>? get rows => _rows;
}
