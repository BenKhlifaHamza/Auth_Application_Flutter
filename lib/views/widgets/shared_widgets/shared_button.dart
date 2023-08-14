import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const SharedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: MaterialButton(
        minWidth: AppValues.widthScreen,
        height: 40,
        splashColor: AppColors.transparentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: AppColors.primaryColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
