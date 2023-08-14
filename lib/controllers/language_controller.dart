import 'package:auth_front_end/core/localization/change_locale.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:get/get.dart';

abstract class AbstractLanguageController extends GetxController {
  void changeLanguage(String languageCode);
  void init();
  void next();
}

class LanguageController extends AbstractLanguageController {
  late LocalController localController;
  late MyServices myServices;
  String? language;

  @override
  void init() {
    localController = Get.find();
    myServices = Get.find();
  }

  @override
  void changeLanguage(String languageCode) {
    localController.changeLanguage(languageCode);
    language = languageCode;
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void next() {
    if (language != null) {
      Get.toNamed(RoutesNames.onBoardingPage);
      myServices.sharedPreferences.setString("step", "1");
    }
  }
}
