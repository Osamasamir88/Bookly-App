import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.featchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaturedBooksFailure(errMessage: failure.errMassage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
