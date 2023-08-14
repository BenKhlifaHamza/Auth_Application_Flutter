import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/functions/info_dialog.dart';
import 'package:auth_front_end/core/handling/handling_data.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/core/status/status_request.dart';
import 'package:auth_front_end/data/data_source/remote/verify_code_forget_remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbstractVerifyCodeForgetController extends GetxController {
  void init();
  void verifyCodeSignUp(String verifCode);
  void resendVerifyCode();
}

class VerifyCodeForgetController extends AbstractVerifyCodeForgetController {
  late String userEmail;
  late StatusRequest statusRequest;
  late VerifyCodeForgetRemote verifyCodeForgetRemote;

  @override
  void init() {
    userEmail = Get.arguments['userEmail'];
    statusRequest = StatusRequest.none;
    verifyCodeForgetRemote = VerifyCodeForgetRemote(Get.find());
  }

  @override
  void verifyCodeSignUp(String verifCode) async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(seconds: 2));
    var response =
        await verifyCodeForgetRemote.verifyCodeForget(userEmail, verifCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(RoutesNames.resetPassword,
            arguments: {"userEmail": userEmail});
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
    var response = await verifyCodeForgetRemote.resendVeerifyCode(userEmail);
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
