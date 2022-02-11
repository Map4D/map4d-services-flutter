import '../results.dart';

///
///
abstract class MFDistanceMatrixRowResult {
  List<MFDistanceMatrixElementResult>? get elements;
}

///
///
class MFDistanceMatrixRowResultImpl implements MFDistanceMatrixRowResult {
  final List<MFDistanceMatrixElementResult>? _elements;

  MFDistanceMatrixRowResultImpl._(this._elements);

  static MFDistanceMatrixRowResultImpl? fromMap(Object? json) {
    if (json == null || json is! Map<dynamic, dynamic>) {
      return null;
    }

    return MFDistanceMatrixRowResultImpl._(toListDistanceMatrixElement(json['elements']));
  }

  @override
  List<MFDistanceMatrixElementResult>? get elements => _elements;
}