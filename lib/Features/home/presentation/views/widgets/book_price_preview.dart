import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookPriceAndPreview extends StatelessWidget {
  const BookPriceAndPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Container(
                //width: 150,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    '19.99€',
                    style: AppTextStyles.priceOfBook.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                //width: 150,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffEF8262),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Free preview',
                    style: AppTextStyles.titleOfBook.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
