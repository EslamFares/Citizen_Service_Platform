import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  //* ----- Initialize SharedPreferences (Call this in main before runApp) ----- */
  //await SharedPrefsHelper.init(); (in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //* ---------------------------- Save String value --------------------------- */
  static Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  //* ---------------------------- Get String value ---------------------------- */
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  //* --------------------------- Save Integer value --------------------------- */
  static Future<bool> setInt(String key, int value) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  //* ---------------------------- Get Integer value --------------------------- */
  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  //* --------------------------- Save Boolean value --------------------------- */
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  //* ---------------------------- Get Boolean value --------------------------- */
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  //* ---------------------------- Save Double value --------------------------- */
  static Future<bool> setDouble(String key, double value) async {
    return await _prefs?.setDouble(key, value) ?? false;
  }

  //* ---------------------------- Get Double value ---------------------------- */
  static double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  //* ------------------------------- Remove key ------------------------------- */
  static Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  //* ----------------------------- Clear all keys ----------------------------- */
  static Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}

//!in main
// WidgetsFlutterBinding.ensureInitialized();
//   await GlobalPrefs.init();
