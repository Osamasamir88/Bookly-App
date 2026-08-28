import 'package:bookly/Core/styles/app_colors.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: BookDetailsViewAppBar(),
      ),

      body: BlocProvider(
        // firstOrNull آمنة حتى لو الـ list فاضية (مش بس null) عشان نتفادي الـ crash
        create: (context) => SimilarBooksCubit(getIt<HomeRepo>())
          ..featchSimilarBooks(
            book.volumeInfo.categories?.firstOrNull ?? 'programming',
          ),
        child: BookDetailsViewBody(book: book),
      ),
    );
  }
}
