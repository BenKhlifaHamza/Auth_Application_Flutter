import 'package:auth_front_end/controllers/language_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButton extends GetView<LanguageController> {
  final void Function() onPressed;
  final String textButton;
  const NextButton(
      {super.key, required this.onPressed, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        minWidth: AppValues.widthScreen,
        splashColor: AppColors.transparentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: controller.language != null
            ? AppColors.primaryColor
            : AppColors.greyColor,
        onPressed: () => onPressed(),
        child: Text(
          textButton,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.whiteColor,
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
