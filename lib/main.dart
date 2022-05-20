import 'package:coffeeapp/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/state/app_state_manager.dart';
import 'pages/state/profile_manager.dart';
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

  //State managers
  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
        ThemeData appTheme;
        if (profileManager.setDarkMode) {
          appTheme = AppTheme.dark();
        } else {
          appTheme = AppTheme.light();
        }
        return MaterialApp(
          theme: appTheme,
          home: const WelcomePage(),
        );
        },
      ),
    );
  }
}