import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:get/get.dart';

abstract class AbstractHommeController extends GetxController {
  void disconnet();
  void init();
}

class HommeController extends AbstractHommeController {
  late MyServices _myServices;
  late StatusRequest statusRequest;

  @override
  void init() {
    _myServices = Get.find();
    statusRequest = StatusRequest.none;
  }

  @override
  void disconnet() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(RoutesNames.loginPage);
    _myServices.sharedPreferences.clear();
    _myServices.sharedPreferences.setString("step", "2");
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
