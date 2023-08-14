import 'package:auth_front_end/controllers/onboarding_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipButtonOnBoarding extends GetView<OnBoardingController> {
  final String textButton;
  const SkipButtonOnBoarding({
    super.key,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width,
      splashColor: AppColors.transparentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.primaryColor,
      onPressed: () => controller.skips(),
      child: Text(
        textButton,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.whiteColor,
            letterSpacing: 1.5),
      ),
    );
  }
}
