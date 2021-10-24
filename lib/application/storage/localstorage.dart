import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _sharedPreferences;

  static final LocalStorage _singleton = LocalStorage._internal();

  LocalStorage._internal() {
    // init the variable
    initializeSharedPrefrences();
  }

  static Future<void> initializeSharedPrefrences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // set the items in shared preferences

  static Future<bool> setIem(String key, String value) async {
    return await _sharedPreferences!.setString(key, value);
  }

  // get item
  static String? getItem(String key) {
    return _sharedPreferences!.getString(key);
  }
}

// https://dev.to/theotherdevs/starting-with-flutter-working-with-sharedpreferences-userdefaults-5dia
