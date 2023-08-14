import 'package:auth_front_end/core/crud/crud.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Crud(), fenix: true);
  }
}
