import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _showGetStartedButton = false;

  bool get getStartedButton => _showGetStartedButton;

  void showGetStartedButton(bool status) {
    _showGetStartedButton = status;
    notifyListeners();
  }
}
