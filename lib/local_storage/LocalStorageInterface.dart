import "package:shared_preferences/shared_preferences.dart";

// abstract class LocalStorageInterface {
//   @required final String _storeName;

//   LocalStorageInterface(this._storeName);

// }

abstract class LocalStorageInterface {
  
  final String _storageName;
  SharedPreferences _pref;

  LocalStorageInterface(this._storageName, this._pref);

  get value;

  set value(value);

  void clearValue();
}