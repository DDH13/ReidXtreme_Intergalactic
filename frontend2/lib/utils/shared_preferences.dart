import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future setBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, true);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future setListString(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }
  static Future<List<String>> getListString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future setInt(String key,int val) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, val);
  }

  static Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future setDouble(String key,double val) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, val);
  }
  static Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future setMap(String key,Map value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }
  static Future<Map> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key) ?? "") ?? {};
  }

  static Future clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
