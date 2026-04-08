import 'package:dio/dio.dart';
import 'package:ecommerce_app2/core/networking/dio_helper.dart';
import 'package:ecommerce_app2/core/routing/router_generation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
