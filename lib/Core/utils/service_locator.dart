import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. أوبجكت Dio موحد للمشروع كله
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // 2. تسجيل HomeRepo بالـ abstraction (مش الـ implementation) — ده الـ DIP
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<ApiService>()));
  // 3. تسجيل SearchRepo بالـ abstraction (مش الـ implementation)
  getIt.registerSingleton<SearchRepo>(SearchRepoImpl(getIt.get<ApiService>()));
}
