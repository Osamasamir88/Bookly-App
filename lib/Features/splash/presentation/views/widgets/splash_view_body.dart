import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  [
        SvgPicture.asset(AppAssets.logo,width: 180,height: 45,),
        const SizedBox(height: 12,),
        const Text('Read Free Books',textAlign: TextAlign.center,),
      ],
    );
  }
}