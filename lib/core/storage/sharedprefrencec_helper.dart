import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;


  static const String authTokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String refreshTokenKey = 'refreshToken';

  static SharedPreferences getInstance() => _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void clearAllCash() {
    _preferences.clear();
  }

  static Future<void> saveToken(String token) async {
    await _preferences.setString(authTokenKey, token);
  }

  static String? getToken() {
    return _preferences.getString(authTokenKey);
  }
  static String? getRefreshToken()  {
    return  _preferences.getString(refreshTokenKey);
  }

  static Future<void> clearToken() async {
    await _preferences.remove(authTokenKey);
    await _preferences.remove(refreshTokenKey);
  }

  static Future<void> saveUserId(String userId) async {
    await _preferences.setString(userIdKey, userId);
  }

  static String? getUserId() {
    return _preferences.getString(userIdKey);
  }
  static Future<void> saveRefreshToken(String refreshToken) async {
    await _preferences.setString(refreshTokenKey, refreshToken);
  }

  // remove refresh token
  static Future<void> removeRefreshToken() async {
    await _preferences.remove(refreshTokenKey);
  }


}