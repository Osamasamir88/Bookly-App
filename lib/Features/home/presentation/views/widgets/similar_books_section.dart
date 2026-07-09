import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // text also like
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'You can also like',
                style: AppTextStyles.titleMed.copyWith(fontSize: 14),
              ),
            ),
          ),

          SizedBox(height: 15),

          // like list
          SizedBox(
            height: 112,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SimilarBooksListView(),
            ),
          ),
      ],
    );
  }
}