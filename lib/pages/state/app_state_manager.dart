import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  
  bool _showGetStartedButton = false;
  int _currentTab = 0;

  bool get getStartedButton => _showGetStartedButton;
  int get getCurretTab => _currentTab;

  void showGetStartedButton(bool status) {
    _showGetStartedButton = status;
    notifyListeners();
  }

  void goToTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
