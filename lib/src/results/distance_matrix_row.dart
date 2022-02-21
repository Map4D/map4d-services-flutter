import '../results.dart';

///
///
abstract class MFDistanceMatrixRowResult {
  List<MFDistanceMatrixElementResult>? get elements;
}

///
///
class DistanceMatrixRowResult implements MFDistanceMatrixRowResult {
  final List<MFDistanceMatrixElementResult>? _elements;

  DistanceMatrixRowResult._(this._elements);

  static DistanceMatrixRowResult? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return DistanceMatrixRowResult._(
        toListDistanceMatrixElement(json['elements']));
  }

  @override
  List<MFDistanceMatrixElementResult>? get elements => _elements;
}
