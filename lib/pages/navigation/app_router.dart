import 'package:coffeeapp/pages/dashboard.dart';
import 'package:coffeeapp/pages/navigation/app_routes.dart';
import 'package:coffeeapp/pages/state/login_manager.dart';
import 'package:coffeeapp/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginManager loginInfo;

  AppRouter(this.loginInfo);

  late final _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    redirect: (state) {
      final onboardingComplete = loginInfo.isOnboardingComplete;
      print(onboardingComplete);
      final isOnboarding = state.location == AppRoutes.welcomePage;

      if (!onboardingComplete && !isOnboarding) return AppRoutes.welcomePage;

      if (onboardingComplete && isOnboarding) return AppRoutes.home;
    },
    refreshListenable: loginInfo,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: AppRoutes.welcomePage,
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );

  GoRouter getRouter() => _router;
}
