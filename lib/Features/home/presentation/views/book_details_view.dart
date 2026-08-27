import 'package:bookly/Core/styles/app_colors.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo.dart';
import 'package:bookly/Features/home/data/models/book_model/repos/home_repo_impl.dart';
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
        create: (context) => SimilarBooksCubit(getIt<HomeRepoImpl>())..featchSimilarBooks(book.volumeInfo.categories?[0] ?? 'programming'),
        child: BookDetailsViewBody(book: book),
      ),
    );
  }
}
