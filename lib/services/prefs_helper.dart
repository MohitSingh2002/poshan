import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {

  void saveAuthCode(int authCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('authCode', authCode);
  }

  Future<int> getAuthCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? authCode = await preferences.getInt('authCode');
    return authCode == null ? 0 : authCode;
  }

}
