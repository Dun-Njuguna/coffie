import 'package:coffeeapp/pages/main/dashboard.dart';
import 'package:coffeeapp/pages/navigation/app_routes.dart';
import 'package:coffeeapp/pages/profile/profile.dart';
import 'package:coffeeapp/pages/state/app_state_manager.dart';
import 'package:coffeeapp/pages/main/welcome_page.dart';
import 'package:coffeeapp/pages/state/login_manager.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final LoginManager _loginManager;
  late final String initialRoute = "/home/${appStateManager.getCurretTab}";

  AppRouter(this._loginManager, this.appStateManager);

  late final _router = GoRouter(
    initialLocation: initialRoute,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    redirect: (state) {
      
      final onboardingComplete = _loginManager.isOnboardingComplete;

      final isOnboarding = state.location == AppRoutes.welcomePage;

      if (!onboardingComplete && !isOnboarding) return AppRoutes.welcomePage;

      if (onboardingComplete && isOnboarding) return initialRoute;
      
      return null;
    },
    refreshListenable: _loginManager,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) {
          String tabIndex = appStateManager.getCurretTab;
          if (state.params.isNotEmpty) {
            tabIndex = state.params[AppRoutes.selectedTab]!;
          }
          return Dashboard(
            currentTabName: tabIndex,
          );
        },
        routes: [
          GoRoute(
            name: AppRoutes.profile,
            path: AppRoutes.profile,
            builder: (context, state) => const Profile(),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.welcomePage,
        path: AppRoutes.welcomePage,
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );

  GoRouter getRouter() => _router;
}
