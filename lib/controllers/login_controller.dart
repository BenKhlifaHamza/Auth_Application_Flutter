import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/services/services.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_model/user_model.dart';
import 'package:auth_front_end/data/data_source/remote/login_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractLoginController extends GetxController {
  void init();
  void login();
  void showPassword();
  void goToSignUp();
  void goToForgetPassWord();
}

class LoginController extends AbstractLoginController {
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  late TextEditingController password;
  late LoginRemote loginRemote;
  late StatusRequest statusRequest;
  late bool isShow;
  final MyServices _myServices = Get.find();
  late UserModel userModel;
  @override
  void init() {
    loginRemote = LoginRemote(Get.find());
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    userModel = UserModel();
    statusRequest = StatusRequest.none;
    isShow = false;
  }

  @override
  void login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      await Future.delayed(const Duration(seconds: 3));
      var response = await loginRemote.login(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          userModel = UserModel.fromJson(response["data"]);
          if (userModel.userAprv == "1") {
            _myServices.sharedPreferences.setString("step", "3");
            _myServices.sharedPreferences.setString("userId", userModel.sId!);
            _myServices.sharedPreferences
                .setString("userEmail", userModel.userEmail!);
            Get.toNamed(RoutesNames.homePage);
          } else {
            Get.toNamed(RoutesNames.varifyCodeSignUp,
                arguments: {"userEmail": userModel.userEmail});
          }
        } else {
          infoDialog("Login Failed", response["message"]);
          update();
        }
      } else {
        update();
      }
    }
  }

  @override
  void showPassword() {
    isShow = !isShow;
    update();
  }

  @override
  void goToSignUp() {
    Get.offAllNamed(RoutesNames.signUpPage);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void goToForgetPassWord() {
    Get.toNamed(RoutesNames.forgetPassWord);
  }
}
