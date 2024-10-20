import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<SharedPreferences> get preferences async => SharedPreferences.getInstance();

  Future<void> set(String key, String data) async {
    final cache = await preferences;
    await cache.setString(key, data);
  }

  Future<String?> get(String key) async {
    final cache = await preferences;
    return cache.getString(key);
  }

  Future<void> del(String key) async {
    final cache = await preferences;
    await cache.remove(key);
  }
}
