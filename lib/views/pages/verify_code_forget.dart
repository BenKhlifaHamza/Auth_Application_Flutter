import 'package:auth_front_end/controllers/verify_code_forget_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/on_will_pop.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:auth_front_end/views/widgets/verify_code_signup/desc_vc_signup.dart';
import 'package:auth_front_end/views/widgets/verify_code_signup/image_vc_signup.dart';
import 'package:auth_front_end/views/widgets/verify_code_signup/textbutton_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeForget extends StatelessWidget {
  const VerifyCodeForget({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeForgetController controllerVCforget =
        Get.put(VerifyCodeForgetController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(AppValues.paddingScreen),
          child: SingleChildScrollView(
            child: GetBuilder<VerifyCodeForgetController>(
              builder: (_) => HandlingView(
                  statusRequest: controllerVCforget.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SharedTitle(title: "36".tr),
                      const SizedBox(
                        height: 10,
                      ),
                      DescVerifyCodeSignUp(
                        text: "35".tr,
                        email: controllerVCforget.userEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OtpTextField(
                        numberOfFields: 5,
                        focusedBorderColor: AppColors.primaryColor,
                        enabledBorderColor: AppColors.primaryColor,
                        showFieldAsBox: true,
                        onSubmit: (String verificationCode) {
                          controllerVCforget.verifyCodeSignUp(verificationCode);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ImageVerifyCodeSignUp(),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButtonResendCode(
                        title: "39".tr,
                        onTap: () => controllerVCforget.resendVerifyCode(),
                      )
                    ],
                  )),
            ),
          ),
        )),
      ),
    );
  }
}
