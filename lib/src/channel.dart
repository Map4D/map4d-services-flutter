part of 'services.dart';

class _ServicesChannel {
  static const MethodChannel _channel = MethodChannel('map4d_services');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map<String, dynamic>?> invokeService(String method, Map<String, Object> data) async {
    return await _channel.invokeMapMethod<String, dynamic>(method, data);
  }
}