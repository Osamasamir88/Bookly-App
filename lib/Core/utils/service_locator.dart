import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo_impl.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. أوبجكت Dio موحد للمشروع كله
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // 2. أوبجكت HomeRepoImpl موحد للمشروع كله
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  // 3. أوبجكت SearchRepoImpl موحد للمشروع كله
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>()));
}
