import 'package:auth_front_end/controllers/signup_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_images.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/on_will_pop.dart';
import 'package:auth_front_end/core/functions/validate_input.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_text_form_field.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:auth_front_end/views/widgets/signup/footr_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controllerSignUp = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(AppValues.paddingScreen),
                child: SingleChildScrollView(
                  child: GetBuilder<SignUpController>(
                    builder: (_) => HandlingView(
                        statusRequest: controllerSignUp.statusRequest,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SharedTitle(title: "28".tr),
                            Image.asset(
                              AppImages.onBoardingImage1,
                              height: AppValues.heightScreen / 3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Form(
                                key: controllerSignUp.formKey,
                                child: Column(
                                  children: [
                                    SharedTextFormField(
                                      textEditingController:
                                          controllerSignUp.name,
                                      keyboardType: TextInputType.text,
                                      labelText: "30".tr,
                                      hintText: "31".tr,
                                      suffixIcon: const Icon(Icons.person),
                                      obscureText: false,
                                      validator: (String? value) {
                                        return validateInput(
                                            30, 2, "_", value!);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SharedTextFormField(
                                      textEditingController:
                                          controllerSignUp.email,
                                      keyboardType: TextInputType.emailAddress,
                                      labelText: "23".tr,
                                      hintText: "24".tr,
                                      suffixIcon: const Icon(Icons.mail),
                                      obscureText: false,
                                      validator: (String? value) {
                                        return validateInput(
                                            30, 1, "email", value!);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SharedTextFormField(
                                      textEditingController:
                                          controllerSignUp.age,
                                      keyboardType: TextInputType.number,
                                      labelText: "32".tr,
                                      hintText: "30",
                                      suffixIcon: const Icon(Icons.numbers),
                                      obscureText: false,
                                      validator: (String? value) {
                                        return validateInput(
                                            30, 2, "age", value!);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SharedTextFormField(
                                      textEditingController:
                                          controllerSignUp.phone,
                                      keyboardType: TextInputType.phone,
                                      labelText: "33".tr,
                                      hintText: "+21655895589",
                                      suffixIcon: const Icon(Icons.phone),
                                      obscureText: false,
                                      validator: (String? value) {
                                        return validateInput(
                                            12, 8, "phone", value!);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SharedTextFormField(
                                      textEditingController:
                                          controllerSignUp.password,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      labelText: "25".tr,
                                      hintText: "* * * * * * * *",
                                      suffixIcon: controllerSignUp.isShow
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                      obscureText: !controllerSignUp.isShow,
                                      validator: (String? value) {
                                        return validateInput(
                                            30, 8, "password", value!);
                                      },
                                      showPassword: () =>
                                          controllerSignUp.showPassword(),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SharedButton(
                              title: "28".tr,
                              onPressed: () => controllerSignUp.signup(),
                            ),
                            FooterSignUp(
                                text1: "34".tr,
                                text2: "22".tr,
                                onTap: () => controllerSignUp.goToLogin())
                          ],
                        )),
                  ),
                )),
          ),
        ));
  }
}
