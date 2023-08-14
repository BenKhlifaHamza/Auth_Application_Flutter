import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:flutter/material.dart';

class ContainerFlou extends StatelessWidget {
  const ContainerFlou({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.heightScreen,
      width: AppValues.widthScreen,
      color: AppColors.greyColor.withOpacity(0.6),
    );
  }
}
