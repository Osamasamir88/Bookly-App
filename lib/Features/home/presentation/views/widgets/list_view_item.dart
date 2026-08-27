import 'package:bookly/Core/widgets/custom_book_image_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * .38,
          height: MediaQuery.of(context).size.height * .26,
          // يعرض أثناء التحميل
          placeholder: (context, url) =>
              CustomBookImageLoadingIndicator(),

          // يعرض في حالة فشل التحميل أو الرابط البايظ
          errorWidget: (context, url, error) => Container(
            color: Colors.grey,
            child: Icon(Icons.error_outline, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }             
}
