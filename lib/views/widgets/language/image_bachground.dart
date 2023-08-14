import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class ImageBackGround extends StatelessWidget {
  const ImageBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.backGround,
      height: AppValues.heightScreen,
      width: AppValues.widthScreen,
    );
  }
}
