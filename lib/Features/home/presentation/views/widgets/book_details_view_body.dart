import 'package:bookly/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 25),

          BookDetailsSection(),

          Expanded(child: SizedBox(height: 40)),

          SimilarBooksSection(),

          SizedBox(height: 25),
        ],
      ),
    );
  }
}

