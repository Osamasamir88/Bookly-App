import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Core/utils/app_constants.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?q=flutter&key=${AppConstants.googleBooksApiKey}',
      );

      // items ممكن ميكونش موجود خالص لو مفيش نتايج، فبنتعامل معاه كـ list فاضية
      List<BookModel> books = (data['items'] as List? ?? [])
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&q=flutter&key=${AppConstants.googleBooksApiKey}&orderBy=newest',
      );

      // items ممكن ميكونش موجود خالص لو مفيش نتايج، فبنتعامل معاه كـ list فاضية
      List<BookModel> books = (data['items'] as List? ?? [])
          .map((item) => BookModel.fromJson(item))
          .toList();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(
    String category,
  ) async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&q=$category&orderBy=relevance&key=${AppConstants.googleBooksApiKey}',
      );
      // items ممكن ميكونش موجود خالص لو مفيش نتايج، فبنتعامل معاه كـ list فاضية
      List<BookModel> books = (data['items'] as List? ?? [])
          .map((item) => BookModel.fromJson(item))
          .toList();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
