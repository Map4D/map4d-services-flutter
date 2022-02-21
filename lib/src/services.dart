import 'dart:async';
import 'package:flutter/services.dart';

import 'results.dart';
import 'utils.dart';

part 'channel.dart';
part 'places.dart';
part 'routes.dart';

class MFServices {
  static final MFPlacesService places = MFPlacesService();
  static final MFRoutesService routes = MFRoutesService();
}
