
import 'dart:async';

import 'package:flutter/services.dart';

class Map4dServices {
  static const MethodChannel _channel = MethodChannel('map4d_services');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
