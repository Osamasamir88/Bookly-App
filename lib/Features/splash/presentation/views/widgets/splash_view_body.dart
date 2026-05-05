import 'package:bookly/Core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 8),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AppAssets.logo, width: 180, height: 45),
        const SizedBox(height: 12),

        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (BuildContext context, Widget? child) {
            return SlideTransition(position: slidingAnimation, child: child);
          },
          child: const Text('Read Free Books', textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
