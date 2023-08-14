import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_source/remote/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractForgetPasswordController extends GetxController {
  void init();
  void checkEmail();
}

class ForgetPasswordController extends AbstractForgetPasswordController {
  late TextEditingController email;
  late StatusRequest statusRequest;
  late ForgetPasswordRemote forgetPasswordRemote;
  late GlobalKey<FormState> formKey;
  @override
  void init() {
    forgetPasswordRemote = ForgetPasswordRemote(Get.find());
    email = TextEditingController();
    statusRequest = StatusRequest.none;
    formKey = GlobalKey<FormState>();
  }

  @override
  void checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      await Future.delayed(const Duration(seconds: 3));
      var response = await forgetPasswordRemote.forgetPassword(email.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(RoutesNames.verifyCodeForget,
              arguments: {"userEmail": email.text});
        } else {
          infoDialog("Warning", response["message"]);
          update();
        }
      } else {
        update();
      }
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
