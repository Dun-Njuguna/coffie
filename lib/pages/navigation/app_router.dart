import 'package:coffeeapp/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomePage(),
      ),
    ],
  );

  GoRouter getRouter() => _router;
}
