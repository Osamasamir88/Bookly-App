import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20),
      itemCount: 10, // رقم افتراضي مؤقتاً لحد ما نربط الـ API
      itemBuilder: (context, index) => BestSellerListViewItem(),
    );
  }
}
