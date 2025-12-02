import 'package:citizen_service_platform/const/locale_keys.g.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_colors.dart';
import 'package:citizen_service_platform/core/utils/app_utils/app_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlOpen(String? linkUsed) async {
  if (linkUsed != null && linkUsed.isNotEmpty) {
    try {
      Uri url = Uri.parse(linkUsed);
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      failedOpenUrl();
    }
  } else {
    failedOpenUrl();
  }
}

void failedOpenUrl() {
  AppToast.toast(
    LocaleKeys.cannotOpenLink.tr(),
    bgColor: AppColors.errorRed300,
  );
}
