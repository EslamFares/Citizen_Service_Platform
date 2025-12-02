import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const IOSOptions _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  // Generic Write (any type)
  static Future<void> write<T>(String key, T value) async {
    await _storage.write(
      key: key,
      value: value.toString(), // Convert to String
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  //*-----------------------------Read String ---------------------------- */
  static Future<String?> readDafault(String key) async {
    return await _storage.read(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  //*------------------ Generic Read (auto-convert to T) ------------------ */
  static Future<T?> read<T>(String key) async {
    String? value = await _storage.read(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );

    if (value == null) return null;

    if (T == String) return value as T;
    if (T == int) return int.tryParse(value) as T?;
    if (T == double) return double.tryParse(value) as T?;
    if (T == bool) return (value.toLowerCase() == 'true') as T;

    // For unsupported types, return null
    return null;
  }

  //*------------------------------ Read Bool ----------------------------- */
  static Future<bool?> readBool(String key) async {
    String? value = await read(key);
    if (value == null) return null;
    return value.toLowerCase() == 'true';
  }

  //*-------------------------------- Read Int -------------------------------- */
  static Future<int?> readInt(String key) async {
    String? value = await read(key);
    if (value == null) return null;
    return int.tryParse(value);
  }

  //*------------------------------- Delete key ------------------------------- */
  static Future<void> delete(String key) async {
    await _storage.delete(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  //*------------------------------- Delete all ------------------------------- */
  static Future<void> deleteAll() async {
    await _storage.deleteAll(aOptions: _androidOptions, iOptions: _iosOptions);
  }

  //*---------------------------- Check key exists ---------------------------- */
  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(
      key: key,
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }

  //*-------------------------------- Read all -------------------------------- */
  static Future<Map<String, String>> readAll() async {
    return await _storage.readAll(
      aOptions: _androidOptions,
      iOptions: _iosOptions,
    );
  }
}
