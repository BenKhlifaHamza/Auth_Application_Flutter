import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:get/get.dart';

abstract class AbstractSuccessSignUpController extends GetxController {
  void goToLogin();
}

class SuccessSignUpController extends AbstractSuccessSignUpController {
  @override
  void goToLogin() {
    Get.offNamed(RoutesNames.loginPage);
  }
}
