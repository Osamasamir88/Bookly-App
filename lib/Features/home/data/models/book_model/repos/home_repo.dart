import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> featchNewestBooks();
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(String category);
}
