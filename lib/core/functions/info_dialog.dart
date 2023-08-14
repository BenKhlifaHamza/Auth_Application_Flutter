import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future infoDialog(String title, String middleText) {
  return Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(color: AppColors.whiteColor),
      middleText: middleText,
      middleTextStyle: const TextStyle(color: AppColors.whiteColor),
      backgroundColor: AppColors.secondaryColor,
      radius: 10);
}
