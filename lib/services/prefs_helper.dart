import 'dart:convert';

import 'package:poshan/models/food_details.dart';
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

  void saveParsedList(List<Parsed> parsedList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('parsedList', jsonEncode(
        parsedList
            .map<Map<String, dynamic>>((parsed) => parsed.toJson())
            .toList(),
    ));
  }

  Future<List<Parsed>> getParsedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? parsedListString = prefs.getString('parsedList') ?? null;
    if(parsedListString == null) {
      return [];
    } else {
      return (jsonDecode(parsedListString) as List<dynamic>)
          .map<Parsed>((item) => Parsed.fromJson(item))
          .toList();
    }
  }

  void removeParsedFromList(int index) async {
    List<Parsed> parsedList = await getParsedList();
    parsedList.removeAt(index);
    saveParsedList(parsedList);
  }

}
