import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  const BookTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .50,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleOfBook,
      ),
    );
  }
}
