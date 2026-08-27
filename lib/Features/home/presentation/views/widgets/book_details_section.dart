import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_price_preview.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // book image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: book.volumeInfo.imageLinks!.thumbnail,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),

        SizedBox(height: 46),

        // book titile
        Text(
          book.volumeInfo.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.titleOfBook.copyWith(fontSize: 30),
        ),

        SizedBox(height: 12),

        // autor of book
        Text(
          book.volumeInfo.authors != null
              ? book.volumeInfo.authors![0]
              : 'No author available',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.autor.copyWith(fontSize: 18),
        ),

        SizedBox(height: 10),

        BookRating(
          rate: book.volumeInfo.customRating.toStringAsFixed(1),
          rateCount: book.volumeInfo.customRatingCount,
        ),

        SizedBox(height: 39),

        BookPriceAndPreview(
          url: book.volumeInfo.previewLink,
          price: book.volumeInfo.customPrice.toStringAsFixed(2),
        ),
      ],
    );
  }
}
