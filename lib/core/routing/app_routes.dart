import 'package:ecommerce_app2/features/auth/login_screen.dart';
import 'package:ecommerce_app2/features/auth/register_screen.dart';
import 'package:ecommerce_app2/features/main_screen/main_screen.dart';
import 'package:ecommerce_app2/features/product_screen/product_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String mainScreen = '/main-screen';
  static const String productScreen = '/product-screen';
  static const String register = '/register';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.mainScreen,
    routes: [
      GoRoute(
        path: AppRouter.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRouter.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.register,
        builder: (context, state) => const RegisterScreen(),
      ),

      GoRoute(
        path: AppRouter.productScreen,
        builder: (context, state) => const ProductScreen(),
      ),
    ],
  );
}
