import 'package:shared_preferences/shared_preferences.dart';
import 'package:trashflow/models/auth/models/profile_google.dart';

class SharedPrefConfig {
  static const String _userLogin = 'is-login';
  static const String _userEmail = 'user-email';
  static const String _userName = 'user-name';
  static const String _userPhotoUrl = 'user-photo-url';
  static const String _userUuid = 'user-uuid';

  static Future<Null> setLogin(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_userLogin, status);
  }

  static Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userLogin) ?? false;
  }

  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmail) ?? '';
  }

  static Future<void> setUserData(ProfileGoogle user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userEmail, user.email.toString());
    prefs.setString(_userName, user.displayName.toString());
    prefs.setString(_userPhotoUrl, user.photoUrl.toString());
    prefs.setString(_userUuid, user.uid.toString());
  }

  static Future<ProfileGoogle?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString(_userEmail);
    String? userName = prefs.getString(_userName);
    String? userPhotoUrl = prefs.getString(_userPhotoUrl);
    String? userUuid = prefs.getString(_userUuid);
    if (userEmail != null && userName != null && userPhotoUrl != null) {
      return ProfileGoogle()
        ..email = userEmail
        ..displayName = userName
        ..photoUrl = userPhotoUrl
      ..uid = userUuid;
    } else {
      return null;
    }
  }

  static Future<bool> removeSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userLogin);
    prefs.remove(_userEmail);
    prefs.remove(_userName);
    prefs.remove(_userPhotoUrl);
    prefs.remove(_userUuid);
    return true;
  }
}
