import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_source/remote/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractResetPasswordController extends GetxController {
  void init();
  void send();
  void showPassword();
}

class ResetPasswordController extends AbstractResetPasswordController {
  late StatusRequest statusRequest;
  late TextEditingController password1;
  late TextEditingController password2;
  late String userEmail;
  late bool isShow;
  late GlobalKey<FormState> formKey;
  late ResetPasswordRemote resetPasswordRemote;

  @override
  void init() {
    resetPasswordRemote = ResetPasswordRemote(Get.find());
    isShow = false;
    formKey = GlobalKey<FormState>();
    statusRequest = StatusRequest.none;
    password1 = TextEditingController();
    password2 = TextEditingController();
    userEmail = Get.arguments["userEmail"];
  }

  @override
  void send() async {
    if (formKey.currentState!.validate()) {
      if (password1.text == password2.text) {
        statusRequest = StatusRequest.loading;
        update();
        await Future.delayed(const Duration(seconds: 3));
        var response =
            await resetPasswordRemote.resetPassword(userEmail, password1.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            Get.offAllNamed(RoutesNames.loginPage);
          } else {
            infoDialog("Error", response["message"]);
          }
        } else {
          update();
        }
      } else {
        infoDialog("Error", "Passwords must be matching");
      }
    }
  }

  @override
  void showPassword() {
    isShow = !isShow;
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
