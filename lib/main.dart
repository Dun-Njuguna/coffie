import 'package:coffeeapp/pages/welcome_page.dart';
import 'package:flutter/material.dart';

import 'utils/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme;
    if (1 == 1) {
      appTheme = AppTheme.dark();
    } else {
      appTheme = AppTheme.light();
    }
    return MaterialApp(
      theme: appTheme,
      home: const WelcomePage(),
    );
  }
}
