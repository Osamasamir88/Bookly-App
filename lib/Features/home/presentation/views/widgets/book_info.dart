import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_price_rate.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_title.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookTitle(title: book.volumeInfo.title!),
          SizedBox(height: 5),
          Text(
            book.volumeInfo.authors != null &&
                    book.volumeInfo.authors!.isNotEmpty
                ? book.volumeInfo.authors![0]
                : 'No author available',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.autor,
          ), // book autor
          SizedBox(height: 8),
          BookPriceAndRate(
            rate: book.volumeInfo.customRating,
            ratingCount: book.volumeInfo.customRatingCount,
            price: book.volumeInfo.customPrice.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }
}
