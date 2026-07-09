import 'package:bookly/Core/styles/app_colors.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: BookDetailsViewAppBar(),
      ),

      body: BookDetailsViewBody(),
    );
  }
}

