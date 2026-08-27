import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  String? lastCategoryQuery;

  featchSimilarBooks(String category) async {
    lastCategoryQuery = category;
    emit(SimilarBooksLoading());
    var result = await homeRepo.featchSimilarBooks(category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errMassage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
