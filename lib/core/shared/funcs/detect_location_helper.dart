import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';

class DetectLocationHelper {
  static Position? _currentLocation;
  static bool _initialized = false;

  static Position? get currentLocation => _currentLocation;
  static bool get initialized => _initialized;

  static Future<void> detectLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        AppToast.toast(LocaleKeys.openLoacationService.tr());
        await Future.delayed(const Duration(milliseconds: 500));
        await Geolocator.openLocationSettings();
        _initialized = false;
        return;
      }

      LocationPermission permission = await _checkAndRequestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        _initialized = false;
        if (permission == LocationPermission.deniedForever) {
          AppToast.toast(LocaleKeys.openLoacationPermission.tr());
          await Future.delayed(const Duration(milliseconds: 500));

          await Geolocator.openAppSettings();
        }
        return;
      }

      _currentLocation = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      _initialized = true;

      // ignore: unused_catch_stack
    } catch (e, stacktrace) {
      // debugPrint("Detect Location Error: $e");
      // debugPrint(stacktrace.toString());
      _initialized = false;
    }
  }

  static Future<LocationPermission> _checkAndRequestPermission() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }
      return permission;
    } catch (e) {
      return LocationPermission.deniedForever;
    }
  }
}
