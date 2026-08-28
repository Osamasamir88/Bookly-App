import 'package:bookly/Core/routing/router_generation_config.dart';
import 'package:bookly/Core/styles/app_colors.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt<HomeRepo>())..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt<HomeRepo>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        routerConfig: RouterGenerationConfig.goRouter,
        //home: SplashView(),
      ),
    );
  }
}
