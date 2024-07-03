import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'beeping_flutter_method_channel.dart';

abstract class BeepingFlutterPlatform extends PlatformInterface {
  /// Constructs a BeepingFlutterPlatform.
  BeepingFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BeepingFlutterPlatform _instance = MethodChannelBeepingFlutter();

  /// The default instance of [BeepingFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBeepingFlutter].
  static BeepingFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BeepingFlutterPlatform] when
  /// they register themselves.
  static set instance(BeepingFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return BeepingFlutterPlatform.instance.getPlatformVersion();
  }

  Future<num?> getBatteryLevel() {
    return BeepingFlutterPlatform.instance.getBatteryLevel();
  }
}
