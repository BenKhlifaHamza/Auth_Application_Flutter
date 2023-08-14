import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:auth_front_end/data/data_model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractOnBoardingController extends GetxController {
  void init();
  void skips();
  void onPageChanged(int index);
}

class OnBoardingController extends AbstractOnBoardingController {
  late List<OnBoardingModel> onBoardingList;
  late PageController pageController;
  late int currentPage;
  late MyServices myServices;

  @override
  init() {
    myServices = Get.find();
    currentPage = 0;
    pageController = PageController();
    onBoardingList = [
      OnBoardingModel("1".tr, AppImages.onBoardingImage1, "2".tr),
      OnBoardingModel("3".tr, AppImages.onBoardingImage2, "4".tr),
      OnBoardingModel("5".tr, AppImages.onBoardingImage3, "6".tr),
      OnBoardingModel("7".tr, AppImages.onBoardingImage4, "8".tr),
    ];
  }

  @override
  skips() {
    currentPage++;
    if (currentPage < onBoardingList.length) {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.bounceOut);
    } else {
      Get.offAndToNamed(RoutesNames.loginPage);
      myServices.sharedPreferences.setString("step", "2");
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
