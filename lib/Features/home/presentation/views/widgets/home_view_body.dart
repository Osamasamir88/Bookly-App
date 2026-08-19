import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
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
        // تحديث كل البيانات في الشاشة دفعة واحدة
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        // لما نخلص ال newest نبقي نضيف الميثود بتعتها
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
                  Text('Best Seller', style: AppTextStyles.titleMed),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // best seller list view
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) => BookListViewItem(),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
