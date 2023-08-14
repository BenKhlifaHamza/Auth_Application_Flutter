import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class ChooseLanguageButton extends StatelessWidget {
  final String textButton;
  final bool selected;
  final void Function() onPressed;
  const ChooseLanguageButton(
      {super.key,
      required this.textButton,
      required this.onPressed,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        minWidth: AppValues.widthScreen,
        splashColor: AppColors.transparentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: selected ? AppColors.primaryColor : AppColors.greyColor,
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
