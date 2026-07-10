
import 'package:bookly/Core/routing/app_routes.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashView,
    routes: [
      GoRoute(
        path: AppRoutes.splashView,
        name: AppRoutes.splashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        name: AppRoutes.homeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppRoutes.bookDetailsView,
        name: AppRoutes.bookDetailsView,
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(
        path: AppRoutes.searchView,
        name: AppRoutes.searchView,
        builder: (context, state) => SearchView(),
      ),
      
    ],
  );
}
