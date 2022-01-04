import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefConfig {

  static const String _userLogin = 'is-login';
  static const String _userEmail = 'user-email';
  static const String _userFirstName = 'user-first-name';
  static const String _userLastName = 'user-last-name';
  static const String _userPhotoUrl = 'user-photo-url';


  static Future<Null> setLogin(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_userLogin, status);
  }

  static Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userLogin) ?? false;
  }
}
