import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:beeping_flutter/beeping_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBeepingFlutter platform = MethodChannelBeepingFlutter();
  const MethodChannel channel = MethodChannel('beeping_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getPlatformVersion') {
          return '0.0.0+1';
        }

        if (methodCall.method == 'getBatteryLevel') {
          return 21;
        }

        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '0.0.0+1');
  });

  test('getBatteryLevel', () async {
    expect(await platform.getBatteryLevel(), 21);
  });
}
