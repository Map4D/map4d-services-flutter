import 'dart:async';
import 'package:flutter/services.dart';

import 'components.dart';

part 'channel.dart';
part 'places.dart';
part 'routes.dart';
part 'geocodes.dart';

class MFServices {

  static final MFPlacesService places = MFPlacesService();
  static final MFRoutesService routes = MFRoutesService();
  static final MFGeocodesService geocodes = MFGeocodesService();

  static Future<String?> get platformVersion async {
    return await _ServicesChannel.platformVersion;
  }
}