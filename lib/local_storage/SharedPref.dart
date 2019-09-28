import "package:meta/meta.dart";
import "package:shared_preferences/shared_preferences.dart";

class SharedPref {

  static SharedPref _instance;
  SharedPreferences pref;

  factory SharedPref() => _getInstance();

  static SharedPref get instance => _getInstance();

  static SharedPref _getInstance() {
    if(_instance == null) {
      _instance = SharedPref._internal();
    }
    return _instance;
  }

  SharedPref._internal();

  // SharedPref.getInstance() {
  //   return SharedPref();
  // }

  Future<void> initial() async {
    if(pref == null) {
      pref = await SharedPreferences.getInstance();
    }
  }

  // static Future<SharedPref> getInstance() async {
  //   if(_instance == null) {
  //     _instance = SharedPref();
  //   }

  //   if(pref == null){
  //     pref = await SharedPreferences.getInstance();
  //   }

  //   return _instance;
  // }

  

}