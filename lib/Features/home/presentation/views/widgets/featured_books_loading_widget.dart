import 'package:bookly/Core/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class FeaturedBooksLoadingWidget extends StatelessWidget {
  const FeaturedBooksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26, // نفس ارتفاع القائمة الحقيقية
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(), // منع السكرول لأن الداتا لسه بتتحمل
        itemCount: 6, // بنحط 6 كروت وهمية تملى الشاشة
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 12,bottom: 12),
          child: CustomBookImageLoadingIndicator(),
        ),
      ),
    );
  }
}
