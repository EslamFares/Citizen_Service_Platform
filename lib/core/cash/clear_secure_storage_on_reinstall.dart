import 'package:citizen_service_platform/core/cash/secure_storage_helper.dart';
import 'package:citizen_service_platform/core/cash/shared_prefs_helper.dart';
import 'package:citizen_service_platform/core/utils/log/logger.dart';

// Call it in main.dart
Future<void> clearSecureStorageOnReinstall() async {
  String key = "hasRunBefore";

  if (!(SharedPrefsHelper.getBool(key) ?? false)) {
    logPro.magenta("has run before :: clear secure storage");
    // await UserHelper.clear();
    await SecureStorageHelper.deleteAll();
    await SharedPrefsHelper.setBool(key, true);
  }

  // first time return null => false :: set true
  // second time return true => !(true) :: nothing do
  // if app uninstall bt def (shared prefs deleted because it part of app files) ↴ ↓
  // so when install again previous data will be deleted :: return !(null =>(false))
  // but when app is running app will return true always
}


//# to stop Backup android. this (stop all backup)
//  android:allowBackup="false" android:fullBackupContent="false" || in manifest in application tag
/*
    <application
        android:label="Fares Helper"
        android:name="${applicationName}"
        android:icon="@mipmap/launcher_icon"
        android:allowBackup="false"
        android:fullBackupContent="false">
*/
//# but if want to (stop backup for FlutterSecureStorage only)
//* 1- create file backup_rules.xml in res (add in it which files you want not backup)
// in file add this
/*
<?xml> version="1.0" encoding="utf-8"?>
<full-backup-content>
  <exclude domain="sharedpref" path="Fluttersecurestorage"/>
</full-backup-content>
 */

//* 2- add in manifest
//add this line android:fullBackupContent="@xml/backup_rules" in application tag
/*
    <application
        android:label="Fares Helper"
        android:name="${applicationName}"
        android:icon="@mipmap/launcher_icon"
        android:fullBackupContent="@xml/backup_rules">
*/