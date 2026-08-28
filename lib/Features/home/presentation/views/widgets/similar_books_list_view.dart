import 'package:bookly/Core/routing/app_routes.dart';
import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (BuildContext context, SimilarBooksState state) {
        return state is SimilarBooksSuccess
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.push(
                    AppRoutes.bookDetailsView,
                    extra: state.books[index],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: state.books[index].volumeInfo.imageUrl == null
                          // لو الكتاب مالوش صورة نعرض placeholder بدل ما يعمل crash
                          ? Container(
                              width: 80,
                              height: 122,
                              color: Colors.grey.withValues(alpha: .3),
                              child: Icon(
                                Icons.menu_book_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  state.books[index].volumeInfo.imageUrl!,
                              width: 80,
                              height: 122,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ),
              )
            : state is SimilarBooksFailure
            ? Column(
                children: [
                  CustomErrorWidget(errMessage: state.errMessage),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      var cubit = BlocProvider.of<SimilarBooksCubit>(context);
                      if (cubit.lastCategoryQuery != null) {
                        cubit.featchSimilarBooks(cubit.lastCategoryQuery!);
                      }
                    },
                    child: Text('Retry'),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
