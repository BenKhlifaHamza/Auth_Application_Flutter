import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class ImageVerifyCodeSignUp extends StatelessWidget {
  const ImageVerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.onBoardingImage3,
      height: AppValues.heightScreen / 2,
    );
  }
}
