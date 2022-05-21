import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {

  var _setDarkMode = true;

  bool get getDarkMode => _setDarkMode;

  set setDarkMode(bool status) {
    _setDarkMode = status;
    notifyListeners();
  }

}
