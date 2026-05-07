import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          itemBuilder: (context, index) => BestSellerListViewItem(),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 30,)),
      ],
    );
  }
}
