
import 'beeping_flutter_platform_interface.dart';

class BeepingFlutter {
  Future<String?> getPlatformVersion() {
    return BeepingFlutterPlatform.instance.getPlatformVersion();
  }
}