import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/data/data_model/onboarding_model.dart';
import 'package:flutter/material.dart';

class PageViewContentOnBoarding extends StatelessWidget {
  final OnBoardingModel item;
  const PageViewContentOnBoarding({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.title!,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          item.imageName!,
          height: AppValues.heightScreen / 2.2,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          item.description!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor),
        )
      ],
    );
  }
}
