import 'dart:math';

import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookPriceAndRate extends StatelessWidget {
  const BookPriceAndRate({
    super.key,
    required this.rate,
    required this.count,
  });
  final int count;
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${getRandomDouble(5, 50).toStringAsFixed(2)} €', style: AppTextStyles.priceOfBook),
        Spacer(),
        SvgPicture.asset(AppAssets.star),
        SizedBox(width: 5),
        Text(rate.toStringAsFixed(1), style: AppTextStyles.rateOfBook),
        SizedBox(width: 5),
        Text('($count)', style: AppTextStyles.countOfRate),
      ],
    );
  }
}


double getRandomDouble(double min, double max) {
  final random = Random();
  return min + random.nextDouble() * (max - min);
}
       