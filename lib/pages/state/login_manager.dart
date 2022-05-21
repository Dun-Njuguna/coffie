import 'package:flutter/material.dart';

class LoginManager extends ChangeNotifier {
  bool _onboardingComplete = false;

  bool get isOnboardingComplete => _onboardingComplete;

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
    notifyListeners();
  }
}
