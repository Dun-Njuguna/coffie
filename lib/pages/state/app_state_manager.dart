import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AppStateManager extends ChangeNotifier {
  bool _showGetStartedButton = false;
  String _currentTab = dashboardTabs.first;

  bool get getStartedButton => _showGetStartedButton;
  String get getCurretTab => _currentTab;

  void showGetStartedButton(bool status) {
    _showGetStartedButton = status;
    notifyListeners();
  }

  void goToTab(String index) {
    _currentTab = index;
    notifyListeners();
  }
}
