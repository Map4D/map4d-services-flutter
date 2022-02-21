class MFServiceError implements Exception {
  /// Error code.
  final String code;

  /// Error message.
  final String message;

  /// Creates a MFServiceError with code and message.
  MFServiceError(this.code, this.message);
}
