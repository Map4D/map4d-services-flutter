import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map4d_services/map4d_services.dart';

void main() {
  const MethodChannel channel = MethodChannel('map4d_services');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Map4dServices.platformVersion, '42');
  });
}
