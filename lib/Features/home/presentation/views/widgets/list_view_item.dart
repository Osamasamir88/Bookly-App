import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width * .38,
      height: MediaQuery.of(context).size.height * .26,
    );
  }
}
