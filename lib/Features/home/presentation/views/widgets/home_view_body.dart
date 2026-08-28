import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // ناخد الـ cubits قبل الـ await عشان نتفادي استخدام context بعد async gap
        final featuredCubit = BlocProvider.of<FeaturedBooksCubit>(context);
        final newestCubit = BlocProvider.of<NewestBooksCubit>(context);
        // تحديث كل البيانات في الشاشة دفعة واحدة وبشكل متوازي
        await Future.wait<void>([
          featuredCubit.fetchFeaturedBooks(),
          newestCubit.fetchNewestBooks(),
        ]);
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  BooksListview(),
                  SizedBox(height: 20),
                  Text('Best Seller', style: AppTextStyles.titleMed),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // best seller list view
          BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              return state is NewestBooksSuccess
                  ? SliverList.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) =>
                          BookListViewItem(book: state.books[index]),
                    )
                  : state is NewestBooksFailure
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            CustomErrorWidget(errMessage: state.errMessage),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<NewestBooksCubit>(
                                  context,
                                ).fetchNewestBooks();
                              },
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
            },
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
