import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewAppBar extends StatelessWidget {
  const BookDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(Icons.close),
          iconSize: 35,
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
          iconSize: 27,
        ),
      ],
    );
  }
}
