import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedPreference>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPreference(sharedPreferences: sharedPrefs);
});

class SharedPreference {
  SharedPreference({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool getHome() {
    return sharedPreferences.getBool(PreferenceConstant.showHome) ?? false;
  }

  Future<bool> setHome(bool vlaue) {
    return sharedPreferences.setBool(PreferenceConstant.showHome, vlaue);
  }

  String getUsername() {
    return sharedPreferences.getString(PreferenceConstant.userName) ?? "";
  }

  Future<bool> setUsername(String vlaue) {
    return sharedPreferences.setString(PreferenceConstant.userName, vlaue);
  }
}

class PreferenceConstant {
  static const showHome = 'showHome';
  static const userName = "userName";
}
