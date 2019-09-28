import "./LocalStorageInterface.dart";
import './SharedPref.dart';
import "package:shared_preferences/shared_preferences.dart";

class ScanResultStorage implements LocalStorageInterface {

  final String _storeName = 'scan_result_list';
  final SharedPref sharedPref = SharedPref();
  SharedPreferences _pref;

  ScanResultStorage() {
    _pref = sharedPref.pref;
  }

  @override
  List<String> get value {
    return _pref.getStringList(_storeName);
  }

  set value (inputValue) {
    _pref.setStringList(_storeName, inputValue);
  }

  void addValue (String input) {
    List<String> curList = _pref.getStringList(_storeName);

    curList.add(input);
  }

  @override
  void clearValue() {
    _pref.remove(_storeName);
  }

}