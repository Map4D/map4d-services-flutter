///
///
class MFServiceError implements Exception {
  final String code;
  final String message;

  MFServiceError(this.code, this.message);
}