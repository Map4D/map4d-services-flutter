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
class MFDistanceMatrixResultImpl implements MFDistanceMatrixResult {
  final List<MFDistanceMatrixRowResult>? _rows;

  MFDistanceMatrixResultImpl._(this._rows);

  static MFDistanceMatrixResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFDistanceMatrixResultImpl._(toListDistanceMatrixRow(json['routeRows']));
  }

  @override
  List<MFDistanceMatrixRowResult>? get rows => _rows;
}