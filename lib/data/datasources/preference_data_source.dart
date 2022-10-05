import 'package:shared_preferences/shared_preferences.dart';

class PreferenceDataSource{
  static const _tokenPref = 'token';

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  void clearAuthToken() {
    _prefs.then((prefs) => prefs.remove(_tokenPref));
  }

  Future<String?> getAuthToken() {
    return _prefs.then((prefs) => prefs.getString(_tokenPref));
  }

  void saveAuthToken(String token) {
    _prefs.then((prefs) => prefs.setString(_tokenPref, token));
  }
}
