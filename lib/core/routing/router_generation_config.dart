import 'package:ecommerce_app2/core/di/service_locator.dart';
import 'package:ecommerce_app2/core/routing/app_routes.dart';
import 'package:ecommerce_app2/features/address/address_screen.dart';
import 'package:ecommerce_app2/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app2/features/auth/login_screen.dart';
import 'package:ecommerce_app2/features/auth/register_screen.dart';
import 'package:ecommerce_app2/features/main_screen/main_screen.dart';
import 'package:ecommerce_app2/features/product_screen/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.registerScreen,
    routes: [
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => locator<AuthCubit>(),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => locator<AuthCubit>(),
              child: const RegisterScreen(),
            ),
      ),
      GoRoute(
        name: AppRoutes.mainScreen,
        path: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: AppRoutes.productScreen,
        path: AppRoutes.productScreen,
        builder: (context, state) => const ProductScreen(),
      ),
      GoRoute(
        name: AppRoutes.addressScreen,
        path: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),
    ],
  );
}
