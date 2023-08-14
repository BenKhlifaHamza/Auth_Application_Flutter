import 'package:auth_front_end/controllers/onboarding_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/views/widgets/onboarding/animate_points_onboarding.dart';
import 'package:auth_front_end/views/widgets/onboarding/page_view_content_onboarding.dart';
import 'package:auth_front_end/views/widgets/onboarding/skip_button_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    OnBoardingController controllerOnBoarding = Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(
          AppValues.paddingScreen,
        ),
        child: Column(
          children: [
            Expanded(
                flex: 6,
                child: PageView.builder(
                    onPageChanged: controllerOnBoarding.onPageChanged,
                    controller: controllerOnBoarding.pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controllerOnBoarding.onBoardingList.length,
                    itemBuilder: (context, index) => PageViewContentOnBoarding(
                        item: controllerOnBoarding.onBoardingList[index]))),
            const Expanded(flex: 1, child: AnimatePointsOnBoarding()),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SkipButtonOnBoarding(textButton: "9".tr),
                ))
          ],
        ),
      )),
    );
  }
}
