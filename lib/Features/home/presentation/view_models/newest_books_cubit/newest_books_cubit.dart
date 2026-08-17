import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.featchNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(errMessage: failure.errMassage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
