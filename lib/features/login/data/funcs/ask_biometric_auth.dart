import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:local_auth/local_auth.dart';

/*
! example
    bool isAuth = await askBiometricAuth();
    if (!isAuth) {
      emit(LoginWithBiometricError(LocaleKeys.operationCancelled.tr()));
      return;
    }
    else{
    -------
    }
 */
Future<bool> askBiometricAuth({
  String? localizedReason,
  bool? biometricOnly,
}) async {
  bool isAuthSuccess = false;
  final LocalAuthentication auth = LocalAuthentication();

  try {
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    // final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (canAuthenticateWithBiometrics) {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason:
            localizedReason ?? LocaleKeys.pleaseAuthenticateToLogin.tr(),
        biometricOnly: biometricOnly ?? false,
      );

      isAuthSuccess = didAuthenticate;
    }
  } catch (e) {
    //*-----------------------------------*/
    isAuthSuccess = false;
    //*-----------------------------------*/

    if (e is LocalAuthException) {
      if (e.code == LocalAuthExceptionCode.userCanceled) {
        logPro.e("userCanceled");
      } else {
        if (e.code == LocalAuthExceptionCode.noCredentialsSet) {
          logPro.e("NO credentials set");
        } else {
          logPro.e("Local Auth Exception : $e");
        }
      }
    } else {
      logPro.e("BiometricScreen Error : $e");
    }
  }
  return isAuthSuccess;
}
