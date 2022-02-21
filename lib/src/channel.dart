part of 'services.dart';

class _ServicesChannel {
  static const MethodChannel _channel = MethodChannel('map4d_services');

  static Future<Map<String, dynamic>?> invokeService(
      String method, Map<String, Object> data) async {
    return _channel.invokeMapMethod<String, dynamic>(method, data);
  }
}
