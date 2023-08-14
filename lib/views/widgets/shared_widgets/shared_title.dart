import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:stroke_text/stroke_text.dart';

class SharedTitle extends StatelessWidget {
  final String title;
  const SharedTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return StrokeText(
      strokeColor: AppColors.primaryColor,
      textColor: AppColors.primaryColor,
      text: title,
      textStyle: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 1.5),
    );
  }
}
