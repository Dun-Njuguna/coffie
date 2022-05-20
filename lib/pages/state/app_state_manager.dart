import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = true;
  bool _onboardingComplete = false;
  bool _showGetStartedButton = false;

  bool get isInitialized => _initialized;
  bool get isOnboardingComplete => _onboardingComplete;
  bool get getStartedButton => _showGetStartedButton;

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void resetOnboarding() {
    _onboardingComplete = false;
    notifyListeners();
  }

  void logout() {
    _onboardingComplete = false;
    _initialized = false;

    notifyListeners();
  }

  void showGetStartedButton(bool status) {
    _showGetStartedButton = status;
    notifyListeners();
  }
}
