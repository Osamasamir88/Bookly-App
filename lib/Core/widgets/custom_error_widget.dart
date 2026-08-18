import 'package:bookly/Core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage, });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: AppTextStyles.countOfRate.copyWith(color: Colors.red),
    );
  }
}
