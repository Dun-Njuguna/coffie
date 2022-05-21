import 'package:coffeeapp/pages/main/dashboard.dart';
import 'package:coffeeapp/pages/navigation/app_routes.dart';
import 'package:coffeeapp/pages/profile/profile.dart';
import 'package:coffeeapp/pages/state/login_manager.dart';
import 'package:coffeeapp/pages/main/welcome_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginManager loginInfo;

  AppRouter(this.loginInfo);

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    redirect: (state) {
      final onboardingComplete = loginInfo.isOnboardingComplete;
      final isOnboarding = state.location == AppRoutes.welcomePage;

      if (!onboardingComplete && !isOnboarding) return AppRoutes.welcomePage;

      if (onboardingComplete && isOnboarding) return AppRoutes.home;
    },
    refreshListenable: loginInfo,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => const Dashboard(
          currentTab: 0,
        ),
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
