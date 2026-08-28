import 'package:bookly/Core/routing/app_routes.dart';
import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_loading_Widget.dart';
import 'package:bookly/Features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListview extends StatelessWidget {
  const BooksListview({super.key});
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
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => context.push(
                  AppRoutes.bookDetailsView,
                  extra: state.books[index],
                ),
                child: ListViewItem(
                  image: state.books[index].volumeInfo.imageUrl,
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Column(
            children: [
              CustomErrorWidget(errMessage: state.errMessage),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FeaturedBooksCubit>(
                    context,
                  ).fetchFeaturedBooks();
                },
                child: Text('Retry'),
              ),
            ],
          );
        } else {
          return Center(child: FeaturedBooksLoadingWidget());
        }
      },
    );
  }
}
