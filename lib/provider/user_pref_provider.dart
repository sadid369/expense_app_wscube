import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefProvider extends ChangeNotifier {
  static const USER_ID_KEY = 'uid';
  int _uid = 0;
  void setUID(int mUID) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt(USER_ID_KEY, mUID);
    _uid = mUID;
    notifyListeners();
  }

  Future<void> getUID() async {
    var pref = await SharedPreferences.getInstance();
    int? uid = pref.getInt(USER_ID_KEY);
    _uid = uid ?? 0;
    notifyListeners();
  }

  getUIDValue() {
    return _uid;
  }
}
