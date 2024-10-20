import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsCache {
  SharedPrefsCache._(SharedPreferences pref) {
    _pref = pref;
    _secureStorage = const FlutterSecureStorage();
  }
  static late SharedPreferences _pref;
  static late FlutterSecureStorage _secureStorage;
  static SharedPrefsCache? _instance;

  static SharedPrefsCache get instance => _instance!;

  static Future<void> init() async {
    if (_instance == null) {
      SharedPreferences.setPrefix('');
    }
    _instance ?? SharedPrefsCache._(await SharedPreferences.getInstance());
  }
}
