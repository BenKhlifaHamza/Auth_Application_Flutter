import 'package:auth_front_end/controllers/forget_password_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/validate_input.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_text_form_field.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassWord extends StatelessWidget {
  const ForgetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controllerForgetPassword =
        Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(AppValues.paddingScreen),
        child: SingleChildScrollView(
          child: GetBuilder<ForgetPasswordController>(
            builder: (_) => HandlingView(
                statusRequest: controllerForgetPassword.statusRequest,
                widget: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
                    SharedTitle(
                      title: "40".tr,
                    ),
                    const SizedBox(height: 20),
                    Form(
                        key: controllerForgetPassword.formKey,
                        child: SharedTextFormField(
                          textEditingController: controllerForgetPassword.email,
                          labelText: "23".tr,
                          hintText: "24".tr,
                          suffixIcon: const Icon(Icons.mail),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String? val) {
                            return validateInput(50, 1, "email", val!);
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SharedButton(
                      title: '41'.tr,
                      onPressed: () => controllerForgetPassword.checkEmail(),
                    )
                  ],
                )),
          ),
        ),
      )),
    );
  }
}
