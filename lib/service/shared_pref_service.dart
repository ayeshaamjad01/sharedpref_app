import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Keys for storing data
  static const String _keyName = 'name';
  static const String _keyUsername = 'username';
  static const String _keyAge = 'age';
  static const String _keyDesignation = 'designation';
  static const String _keyCompany = 'company';

  // Save data to SharedPreferences
  Future<void> saveUserData({
    required String name,
    required String username,
    required String age,
    required String designation,
    required String company,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyAge, age);
    await prefs.setString(_keyDesignation, designation);
    await prefs.setString(_keyCompany, company);
  }

  // Load data from SharedPreferences
  Future<Map<String, String?>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      _keyName: prefs.getString(_keyName),
      _keyUsername: prefs.getString(_keyUsername),
      _keyAge: prefs.getString(_keyAge),
      _keyDesignation: prefs.getString(_keyDesignation),
      _keyCompany: prefs.getString(_keyCompany),
    };
  }

  // Clear all user data from SharedPreferences
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyName);
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyAge);
    await prefs.remove(_keyDesignation);
    await prefs.remove(_keyCompany);
  }
}
