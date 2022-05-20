import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {

  var _setDarkMode = false;

  bool get setDarkMode => _setDarkMode;

  set setDarkMode(bool status) {
    _setDarkMode = status;
    notifyListeners();
  }

}
