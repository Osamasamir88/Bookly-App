import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .18,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Image.asset(AppAssets.booktest),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleOfBook,
                  ),
                ),
                SizedBox(height: 5),
                Text('J.K. Rowling', style: AppTextStyles.autor),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('19.99 €', style: AppTextStyles.priceOfBook),
                    Spacer(),
                    SvgPicture.asset(AppAssets.star),
                    SizedBox(width: 5),
                    Text('4.8', style: AppTextStyles.rateOfBook),
                    SizedBox(width: 5),
                    Text('(2390)', style: AppTextStyles.countOfRate),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
