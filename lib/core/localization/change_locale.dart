import 'package:auth_front_end/core/decoration/app_theme.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  static late Locale language;
  static late ThemeData myTheme;
  late MyServices myServices;

  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("languageCode", languageCode);
    languageCode == "ar"
        ? myTheme = AppTheme.arabicTheme
        : myTheme = AppTheme.englishTheme;
    Get.changeTheme(myTheme);
    Get.updateLocale(locale);
  }

  checkInitialLanguage() {
    String? languageCode =
        myServices.sharedPreferences.getString("languageCode");
    language = Locale(languageCode ?? Get.deviceLocale!.languageCode);
    languageCode == "ar"
        ? myTheme = AppTheme.arabicTheme
        : myTheme = AppTheme.englishTheme;
  }

  @override
  void onInit() {
    myServices = Get.find();
    checkInitialLanguage();
    super.onInit();
  }
}
