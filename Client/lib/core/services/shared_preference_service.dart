import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

import '../models/user_model.dart';

// TODO: add docs
class SharedPreferenceService {
  /// Lock is used to ensure safe asynchronous write operations on [SharedPreferences].
  final _lock = Lock();

  SharedPreferences? _sharedPreferences;
  final EncryptedSharedPreferences _encryptedSharedPreferences;

  SharedPreferenceService({
    SharedPreferences? sharedPreferences,
    EncryptedSharedPreferences? encryptedSharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _encryptedSharedPreferences =
            encryptedSharedPreferences ?? EncryptedSharedPreferences();

  /// Initializes this service by calling [SharedPreferences.getInstance].
  Future<void> _init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<void> write(String key, String value) async {
    await _init();
    return await _lock.synchronized(
      () => _sharedPreferences?.setString(key, value),
    );
  }

  Future<void> writeEncrypted(String key, String value) async {
    await _init();
    return await _lock.synchronized(
      () => _encryptedSharedPreferences.setString(key, value),
    );
  }

  Future<String?> read(String key) async {
    await _init();
    return _sharedPreferences?.getString(key);
  }

  Future<String> readEncrypted(String key) async {
    await _init();
    return await _encryptedSharedPreferences.getString(key);
  }

  Future<void> remove(String key) async {
    await _init();
    return await _lock.synchronized(
      () => _sharedPreferences?.remove(key),
    );
  }

  /// Clears all shared preferences values.
  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  /// Returns the stored user details.
  Future<UserModel?> readUser() async {
    final json = await readEncrypted('user');
    if (json.isEmpty) return null;
    return UserModel.fromJson(jsonDecode(json));
  }

  /// Updates the stored user details.
  Future<void> saveUser(UserModel user) =>
      writeEncrypted('user', jsonEncode(user));
}
