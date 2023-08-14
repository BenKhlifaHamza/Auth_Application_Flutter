import 'dart:io';

import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> onWillPop() {
  Get.defaultDialog(
    title: "Warning",
    titleStyle: const TextStyle(color: AppColors.whiteColor),
    middleText: "Do You WAnt Exit This App ?",
    middleTextStyle: const TextStyle(color: AppColors.whiteColor),
    backgroundColor: AppColors.secondaryColor,
    radius: 10,
    cancel: MaterialButton(
      color: AppColors.primaryColor,
      onPressed: () {
        Get.back();
      },
      child: const Text(
        "No",
        style: TextStyle(color: AppColors.whiteColor),
      ),
    ),
    confirm: MaterialButton(
      color: AppColors.redColor,
      onPressed: () {
        exit(0);
      },
      child: const Text(
        "Exit",
        style: TextStyle(color: AppColors.whiteColor),
      ),
    ),
  );
  return Future.value(true);
}
