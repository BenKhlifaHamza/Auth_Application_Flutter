import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_model/user_model.dart';
import 'package:auth_front_end/data/data_source/remote/signup_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractSignUpController extends GetxController {
  void init();
  void signup();
  void goToLogin();
  void showPassword();
}

class SignUpController extends AbstractSignUpController {
  late GlobalKey<FormState> formKey;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController phone;
  late TextEditingController password;
  late StatusRequest statusRequest;
  late UserModel userModel;
  late SignUpRemote signUpRemote;
  late bool isShow;

  @override
  void init() {
    signUpRemote = SignUpRemote(Get.find());
    name = TextEditingController();
    email = TextEditingController();
    age = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey<FormState>();
    statusRequest = StatusRequest.none;
    userModel = UserModel();
    isShow = false;
  }

  @override
  void signup() async {
    //  Get.offAndToNamed(RoutesNames.varifyCodeSignUp);
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      userModel = UserModel(
          userName: name.text,
          userAge: age.text,
          userEmail: email.text,
          userPhone: phone.text,
          userPassword: password.text);

      await Future.delayed(const Duration(seconds: 3));
      var response = await signUpRemote.signup(userModel);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offAndToNamed(RoutesNames.varifyCodeSignUp,
              arguments: {"userEmail": userModel.userEmail});
        } else {
          infoDialog("Signup Failed", response["message"]);
          update();
        }
      } else {
        update();
      }
    }
  }

  @override
  void goToLogin() {
    Get.offAllNamed(RoutesNames.loginPage);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void showPassword() {
    isShow = !isShow;
    update();
  }
}
