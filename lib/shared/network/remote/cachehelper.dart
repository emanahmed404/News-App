import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences ;
  static const String _keyisDark = 'isDark' ;
  static init() async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key ,
    required bool value ,
})async{
    return await sharedPreferences.setBool(key, value);
  }


static bool? getBoolean ()=>sharedPreferences.getBool(_keyisDark);
}