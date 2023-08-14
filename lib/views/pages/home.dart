import 'package:auth_front_end/controllers/home_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stroke_text/stroke_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HommeController controllerHomme = Get.put(HommeController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppValues.paddingScreen),
          child: GetBuilder<HommeController>(
            builder: (_) => HandlingView(
                statusRequest: controllerHomme.statusRequest,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StrokeText(
                      strokeColor: AppColors.blackColor,
                      textColor: AppColors.primaryColor,
                      strokeWidth: 3,
                      text: "45".tr,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          letterSpacing: 1.5),
                    ),
                    SharedButton(
                        title: "46".tr,
                        onPressed: () => controllerHomme.disconnet())
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
