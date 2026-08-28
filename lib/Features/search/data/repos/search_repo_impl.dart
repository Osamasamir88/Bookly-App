import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Core/utils/app_constants.dart';
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
        endpoint: 'volumes?q=$category&key=${AppConstants.googleBooksApiKey}',
      );

      // items ممكن ميكونش موجود خالص لو البحث مفيهوش نتايج، فبنتعامل معاه كـ list فاضية
      List<BookModel> books = (result['items'] as List? ?? [])
          .map((item) => BookModel.fromJson(item))
          .toList();
      return right(books);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioError(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
