import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';

class FooterSignUp extends StatelessWidget {
  final Function() onTap;
  final String text1;
  final String text2;
  const FooterSignUp(
      {super.key,
      required this.onTap,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text1),
          Text(
            text2,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
