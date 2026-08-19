import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/utils/api_service.dart';
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
        endpoint:
            'volumes?q=flutter&key=AIzaSyBp6fM4i8456OeDg4Uai8piFwafT-3Zv5M',
      );

      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }

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
            'volumes?filter=free-ebooks&q=sports&key=AIzaSyBp6fM4i8456OeDg4Uai8piFwafT-3Zv5M&Sorting=newest',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
