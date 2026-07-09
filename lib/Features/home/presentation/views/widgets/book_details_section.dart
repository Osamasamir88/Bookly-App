import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_price_preview.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // book image
        Image.asset(
          AppAssets.booktest,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
        ),

        SizedBox(height: 46),

        // book titile
        Text(
          'The Jungle Book',
          style: AppTextStyles.titleOfBook.copyWith(fontSize: 30),
        ),

        SizedBox(height: 12),

        // autor of book
        Text(
          'Rudyard Kipling',
          style: AppTextStyles.autor.copyWith(fontSize: 18),
        ),

        SizedBox(height: 10),

        BookRating(),

        SizedBox(height: 39),

        BookPriceAndPreview(),
      ],
    );
  }
}
