import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_source/remote/verify_code_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractVCSignUpController extends GetxController {
  void init();
  void verifyCodeSignUp(String verifCode);
  void resendVerifyCode();
}

class VCSignUpController extends AbstractVCSignUpController {
  late String userEmail;
  late StatusRequest statusRequest;
  late VerifyCodeSignUpRemote verifyCodeSignUpRemote;

  @override
  void init() {
    userEmail = Get.arguments['userEmail'];
    statusRequest = StatusRequest.none;
    verifyCodeSignUpRemote = VerifyCodeSignUpRemote(Get.find());
  }

  @override
  void verifyCodeSignUp(String verifCode) async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(seconds: 2));
    var response =
        await verifyCodeSignUpRemote.verifyCodeSignUp(userEmail, verifCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(RoutesNames.successSignUp);
      } else {
        infoDialog("Verification Failed", response["message"]);
        update();
      }
    } else {
      update();
    }
  }

  @override
  void resendVerifyCode() async {
    var response = await verifyCodeSignUpRemote.resendVeerifyCode(userEmail);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar("Verify code updated", "Check your email for a new code.",
            colorText: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            dismissDirection: DismissDirection.startToEnd,
            forwardAnimationCurve: Curves.decelerate);
      } else {
        Get.snackbar("Error", response["message"]);
      }
    } else {
      statusRequest = StatusRequest.success;
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
