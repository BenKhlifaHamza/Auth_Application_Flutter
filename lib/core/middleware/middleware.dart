import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    String? step = myServices.sharedPreferences.getString("step");

    switch (step) {
      case "1":
        return const RouteSettings(name: RoutesNames.onBoardingPage);

      case "2":
        return const RouteSettings(name: RoutesNames.loginPage);

      case "3":
        return const RouteSettings(name: RoutesNames.homePage);

      default:
        return null;
    }
  }
}
