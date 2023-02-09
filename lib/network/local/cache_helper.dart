class CacheHelper
{
  static SharedPreferences sharedPreferences;
 static init() async
 {
  sharedPreferences =await SharedPreferences.getInstance();
  
 }
 static Future<void> putBoolean({required String key ,  required bool value })async
 {
 return await  sharedPreferences.setBool(key:value);
 }
  static bool getBoolean({required String key  })async
 {
 return sharedPreferences.getBool(key);
 }
}