import 'package:flutter_test/flutter_test.dart';
import 'package:beeping_flutter/beeping_flutter.dart';
import 'package:beeping_flutter/beeping_flutter_platform_interface.dart';
import 'package:beeping_flutter/beeping_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBeepingFlutterPlatform
    with MockPlatformInterfaceMixin
    implements BeepingFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BeepingFlutterPlatform initialPlatform = BeepingFlutterPlatform.instance;

  test('$MethodChannelBeepingFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBeepingFlutter>());
  });

  test('getPlatformVersion', () async {
    BeepingFlutter beepingFlutterPlugin = BeepingFlutter();
    MockBeepingFlutterPlatform fakePlatform = MockBeepingFlutterPlatform();
    BeepingFlutterPlatform.instance = fakePlatform;

    expect(await beepingFlutterPlugin.getPlatformVersion(), '42');
  });
}
