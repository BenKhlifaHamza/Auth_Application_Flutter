import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';

class TextButtonResendCode extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const TextButtonResendCode(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.transparentColor,
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
