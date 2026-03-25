import 'package:ecommerce_app2/features/auth/login_screen.dart';
import 'package:ecommerce_app2/features/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.login,
    routes: [
      GoRoute(
        path: AppRouter.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      // GoRoute(
      //   path: AppRouter.onboarding,
      //   builder: (context, state) => const OnboardingScreen(),
      // ),
      // GoRoute(
      //   path: AppRouter.home,
      //   builder: (context, state) => const HomeScreen(),
      // ),
    ],
  );
}
