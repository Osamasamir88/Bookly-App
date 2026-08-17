import 'package:bookly/Core/routing/router_generation_config.dart';
import 'package:bookly/Core/styles/app_colors.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      routerConfig: RouterGenerationConfig.goRouter,
      //home: SplashView(),
    );
  }
}
