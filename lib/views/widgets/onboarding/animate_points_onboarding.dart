import 'package:auth_front_end/controllers/onboarding_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatePointsOnBoarding extends GetView<OnBoardingController> {
  const AnimatePointsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          controller.onBoardingList.length,
          (index) => GetBuilder<OnBoardingController>(
              builder: (controllerOnBoarding) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: controllerOnBoarding.currentPage == index ? 30 : 10,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(11)),
                  )),
        )
      ],
    );
  }
}
