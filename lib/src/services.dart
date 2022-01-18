import 'dart:async';
import 'package:flutter/services.dart';

import 'components.dart';

part 'channel.dart';
part 'places.dart';

class MFServices {

  static final MFPlaceService places = MFPlaceService();

  static Future<String?> get platformVersion async {
    return await _ServicesChannel.platformVersion;
  }
}