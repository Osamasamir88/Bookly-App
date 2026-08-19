import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_loading_Widget.dart';
import 'package:bookly/Features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListview extends StatelessWidget {
  const BooksListview({super.key});
  //final List<String> images = const [AppAssets.book1test, AppAssets.book2test];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .26,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => ListViewItem(
                image: state.books[index].volumeInfo.imageLinks!.thumbnail,
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return Center(child: FeaturedBooksLoadingWidget());
        }
      },
    );
  }
}
