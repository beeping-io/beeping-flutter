import 'package:flutter_test/flutter_test.dart';
import 'package:beeping_flutter/beeping_flutter.dart';
import 'package:beeping_flutter/beeping_flutter_platform_interface.dart';
import 'package:beeping_flutter/beeping_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBeepingFlutterPlatform
    with MockPlatformInterfaceMixin
    implements BeepingFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('0.0.0+1');

  @override
  Future<num?> getBatteryLevel() => Future.value(21);
}

void main() {
  final BeepingFlutterPlatform initialPlatform =
      BeepingFlutterPlatform.instance;

  test('$MethodChannelBeepingFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBeepingFlutter>());
  });

  test('getPlatformVersion', () async {
    BeepingFlutter beepingFlutterPlugin = BeepingFlutter();
    MockBeepingFlutterPlatform fakePlatform = MockBeepingFlutterPlatform();
    BeepingFlutterPlatform.instance = fakePlatform;

    expect(await beepingFlutterPlugin.getPlatformVersion(), '0.0.0+1');
  });

  // We're creating a new test to verify if the previously overridden value is returned correctly.
  test('getBatteryLevel', () async {
    BeepingFlutter beepingFlutterPlugin = BeepingFlutter();
    MockBeepingFlutterPlatform fakePlatform = MockBeepingFlutterPlatform();
    BeepingFlutterPlatform.instance = fakePlatform;

    expect(await beepingFlutterPlugin.getBatteryLevel(), 21);
  });
}
