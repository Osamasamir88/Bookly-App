import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  String? lastSearchQuery;

  featchBooksBySearch(String category) async {
    lastSearchQuery = category;   // دي علشان لما نيجي نعمل ريفريش يبقي معانا اخر كلمه اليوزر سرش عليها
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(category);
    result.fold(
      (failure) => emit(SearchFailure((failure.errMassage))),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
