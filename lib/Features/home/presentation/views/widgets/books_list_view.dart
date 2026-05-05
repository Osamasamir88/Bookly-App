import 'package:bookly/Core/utils/app_assets.dart';
import 'package:bookly/Features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';

class BooksListview extends StatelessWidget {
  const BooksListview({super.key});
  final List<String> images = const [AppAssets.book1test, AppAssets.book2test];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) => ListViewItem(image: images[index]),
      ),
    );
  }
}
