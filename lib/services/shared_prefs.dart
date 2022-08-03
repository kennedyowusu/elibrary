import 'package:shared_preferences/shared_preferences.dart';

class Persistent {
  late SharedPreferences preferences;
  int? initScreen;

  // Get int
  Future<int?> getInt(String key) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  // Set int
  Future<void> setInt(String key, int value) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  // Store user data in shared preferences
  Future<void> setUserData(String key, String value) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  // Get user data from shared preferences
  Future<String?> getUserData(String key) async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  // Remove user data from shared preferences
  Future<void> removeUserData(String key) async {
    preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  // Clear all user data from shared preferences
  Future<void> clearUserData() async {
    preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
