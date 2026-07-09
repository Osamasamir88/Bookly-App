import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookPriceAndRate extends StatelessWidget {
  const BookPriceAndRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('19.99 €', style: AppTextStyles.priceOfBook),
        Spacer(),
        SvgPicture.asset(AppAssets.star),
        SizedBox(width: 5),
        Text('4.8', style: AppTextStyles.rateOfBook),
        SizedBox(width: 5),
        Text('(2390)', style: AppTextStyles.countOfRate),
      ],
    );
  }
}

