import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  ApiService apiService;
  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
    String category,
  ) async {
    try {
      var result = await apiService.get(
        endpoint:
            'volumes?q=$category&key=AIzaSyBp6fM4i8456OeDg4Uai8piFwafT-3Zv5M',
      );

      List<BookModel> books = [];
      for (var item in result["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
