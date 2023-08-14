import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class TitleLanguagePage extends StatelessWidget {
  final String title;
  const TitleLanguagePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: StrokeText(
        strokeColor: AppColors.blackColor,
        textColor: AppColors.blackColor,
        text: title,
        textStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 1.5),
      ),
    );
  }
}
