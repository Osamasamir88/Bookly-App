import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImageLoadingIndicator extends StatelessWidget {
  const CustomBookImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[500]!,
        child: Container(
          // تحديد العرض والارتفاع صراحة بنفس مقاسات الكارت الحقيقي
          width: MediaQuery.of(context).size.width * .38,
          height: MediaQuery.of(context).size.height * .26,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
