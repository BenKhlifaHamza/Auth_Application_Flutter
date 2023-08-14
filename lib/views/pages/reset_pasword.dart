import 'package:auth_front_end/controllers/reset_password_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/on_will_pop.dart';
import 'package:auth_front_end/core/functions/validate_input.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_text_form_field.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controllerResetPassword =
        Get.put(ResetPasswordController());
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(AppValues.paddingScreen),
            child: SingleChildScrollView(
              child: GetBuilder<ResetPasswordController>(
                builder: (_) => HandlingView(
                  statusRequest: controllerResetPassword.statusRequest,
                  widget: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SharedTitle(title: "42".tr),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: controllerResetPassword.formKey,
                          child: Column(
                            children: [
                              SharedTextFormField(
                                textEditingController:
                                    controllerResetPassword.password1,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: "43".tr,
                                hintText: "* * * * * * * *",
                                suffixIcon: controllerResetPassword.isShow
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                obscureText: !controllerResetPassword.isShow,
                                validator: (String? value) {
                                  return validateInput(
                                      30, 8, "password", value!);
                                },
                                showPassword: () =>
                                    controllerResetPassword.showPassword(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SharedTextFormField(
                                textEditingController:
                                    controllerResetPassword.password2,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: "44".tr,
                                hintText: "* * * * * * * *",
                                suffixIcon: controllerResetPassword.isShow
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                obscureText: !controllerResetPassword.isShow,
                                validator: (String? value) {
                                  return validateInput(
                                      30, 8, "password", value!);
                                },
                                showPassword: () =>
                                    controllerResetPassword.showPassword(),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      SharedButton(
                          title: "41".tr,
                          onPressed: () => controllerResetPassword.send())
                    ],
                  ),
                ),
              ),
            ),
          )),
        ));
  }
}
