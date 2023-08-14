import 'package:auth_front_end/controllers/language_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/views/widgets/language/choose_language_button.dart';
import 'package:auth_front_end/views/widgets/language/container_flou.dart';
import 'package:auth_front_end/views/widgets/language/next_button.dart';
import 'package:auth_front_end/views/widgets/language/title_language_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language/image_bachground.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController controllerLanguage = Get.put(LanguageController());
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
            child: Stack(
          children: [
            const ImageBackGround(),
            const ContainerFlou(),
            Padding(
              padding: const EdgeInsets.all(AppValues.paddingScreen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  TitleLanguagePage(title: "13".tr),
                  const Spacer(
                    flex: 4,
                  ),
                  ChooseLanguageButton(
                    textButton: "10".tr,
                    selected: controllerLanguage.language == "ar",
                    onPressed: () {
                      controllerLanguage.changeLanguage("ar");
                    },
                  ),
                  ChooseLanguageButton(
                    textButton: "11".tr,
                    selected: controllerLanguage.language == "en",
                    onPressed: () {
                      controllerLanguage.changeLanguage("en");
                    },
                  ),
                  ChooseLanguageButton(
                    textButton: "12".tr,
                    selected: controllerLanguage.language == "fr",
                    onPressed: () {
                      controllerLanguage.changeLanguage("fr");
                    },
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  NextButton(
                    textButton: "14".tr,
                    onPressed: () {
                      controllerLanguage.next();
                    },
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
