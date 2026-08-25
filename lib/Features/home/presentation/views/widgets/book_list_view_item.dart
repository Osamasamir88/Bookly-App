import 'package:bookly/Core/routing/app_routes.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_info.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.bookDetailsView,extra: book),
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            // صورة الكتاب
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 2.6/4,
                child: CachedNetworkImage(
                  imageUrl: book.volumeInfo.imageLinks!.thumbnail,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    child: Icon(Icons.error_outline, color: Colors.white),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
             // book image
            SizedBox(width: 30),

            BookInfo(book: book,),
          ],
        ),
      ),
    );
  }
}
