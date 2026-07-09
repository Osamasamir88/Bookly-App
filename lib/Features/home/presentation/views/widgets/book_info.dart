import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_price_rate.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_title.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookTitle(),
          SizedBox(height: 5),
          Text('J.K. Rowling', style: AppTextStyles.autor), // book autor
          SizedBox(height: 8),
          BookPriceAndRate(),
        ],
      ),
    );
  }
}

