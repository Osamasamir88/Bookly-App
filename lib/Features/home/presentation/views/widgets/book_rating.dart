import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rate, required this.rateCount});
  final String rate ;
  final int? rateCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.star),
        SizedBox(width: 5),
        Text(rate, style: AppTextStyles.rateOfBook),
        SizedBox(width: 5),
        Text('($rateCount)', style: AppTextStyles.countOfRate),
      ],
    );
  }
}
