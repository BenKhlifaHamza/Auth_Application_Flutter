import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.none:
        return widget;
      case StatusRequest.success:
        return widget;
      case StatusRequest.loading:
        return Center(
            child: Lottie.asset(AppImages.loading,
                height: AppValues.heightScreen, width: AppValues.widthScreen));
      case StatusRequest.failure:
        return Center(
            child: Lottie.asset(AppImages.failed,
                height: AppValues.heightScreen, width: AppValues.widthScreen));
      case StatusRequest.serverFailure:
        return Center(
            child: Lottie.asset(AppImages.failed,
                height: AppValues.heightScreen, width: AppValues.widthScreen));
      case StatusRequest.serverExeption:
        return Center(
            child: Lottie.asset(AppImages.failed,
                height: AppValues.heightScreen, width: AppValues.widthScreen));
      case StatusRequest.offlineFailure:
        return Center(
            child: Lottie.asset(AppImages.offline,
                height: AppValues.heightScreen, width: AppValues.widthScreen));
    }
  }
}
