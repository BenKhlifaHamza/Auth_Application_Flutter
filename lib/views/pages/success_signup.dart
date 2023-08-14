import 'package:auth_front_end/controllers/success_signup_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/on_will_pop.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:auth_front_end/views/widgets/success_signup/desc_success_signup.dart';
import 'package:auth_front_end/views/widgets/success_signup/image_success_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpController successSignUpController =
        Get.put(SuccessSignUpController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(AppValues.paddingScreen),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SharedTitle(
                title: "37".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              DescSuccessSignUp(text: "38".tr),
              const SizedBox(
                height: 20,
              ),
              const ImageSuccessSignUp(),
              const Spacer(),
              SharedButton(
                title: "22".tr,
                onPressed: () => successSignUpController.goToLogin(),
              )
            ],
          ),
        )),
      ),
    );
  }
}
