import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {
  const ImageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.onBoardingImage2,
      height: AppValues.heightScreen / 3,
    );
  }
}
