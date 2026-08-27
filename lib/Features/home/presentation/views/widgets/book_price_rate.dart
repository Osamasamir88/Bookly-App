import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookPriceAndRate extends StatelessWidget {
  const BookPriceAndRate({
    super.key,
    required this.rate,
    required this.ratingCount,
    required this.price,
  });
  final int ratingCount;
  final num rate;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$price €', style: AppTextStyles.priceOfBook),
        Spacer(),
        SvgPicture.asset(AppAssets.star),
        SizedBox(width: 5),
        Text(rate.toStringAsFixed(1), style: AppTextStyles.rateOfBook),
        SizedBox(width: 5),
        Text('($ratingCount)', style: AppTextStyles.countOfRate),
      ],
    );
  }
}
