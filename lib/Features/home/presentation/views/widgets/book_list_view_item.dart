import 'package:bookly/Core/routing/app_routes.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.bookDetailsView),
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            Image.asset(AppAssets.booktest), // book image
            SizedBox(width: 30),
            BookInfo(),
          ],
        ),
      ),
    );
  }
}
