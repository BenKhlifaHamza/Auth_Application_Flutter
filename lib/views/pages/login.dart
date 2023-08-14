import 'package:auth_front_end/controllers/login_controller.dart';
import 'package:auth_front_end/core/constantes/app_colors.dart';
import 'package:auth_front_end/core/constantes/app_values.dart';
import 'package:auth_front_end/core/functions/on_will_pop.dart';
import 'package:auth_front_end/core/functions/validate_input.dart';
import 'package:auth_front_end/core/handling/handling_view.dart';
import 'package:auth_front_end/views/widgets/login/footer_text_login.dart';
import 'package:auth_front_end/views/widgets/login/image_login.dart';
import 'package:auth_front_end/views/widgets/login/text_button_login.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_button.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_text_form_field.dart';
import 'package:auth_front_end/views/widgets/shared_widgets/shared_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controllerLogin = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(AppValues.paddingScreen),
          child: SingleChildScrollView(
            child: GetBuilder<LoginController>(
              builder: (_) => HandlingView(
                statusRequest: controllerLogin.statusRequest,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SharedTitle(title: "22".tr),
                    SizedBox(
                      height: AppValues.heightScreen / 12,
                    ),
                    const ImageLogin(),
                    Form(
                        key: controllerLogin.formKey,
                        child: Column(
                          children: [
                            SharedTextFormField(
                              textEditingController: controllerLogin.email,
                              labelText: "23".tr,
                              hintText: "24".tr,
                              suffixIcon: const Icon(Icons.mail),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              validator: (String? val) {
                                return validateInput(50, 1, "email", val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SharedTextFormField(
                              textEditingController: controllerLogin.password,
                              obscureText: !controllerLogin.isShow,
                              labelText: "25".tr,
                              hintText: "* * * * * * * *",
                              suffixIcon: controllerLogin.isShow
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (String? val) {
                                return validateInput(50, 0, "_", val!);
                              },
                              showPassword: () {
                                controllerLogin.showPassword();
                              },
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButtonLogin(
                        title: "26".tr,
                        onTap: () => controllerLogin.goToForgetPassWord(),
                      ),
                    ),
                    SharedButton(
                      title: "22".tr,
                      onPressed: () {
                        controllerLogin.login();
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFooterLogin(
                      text1: "27".tr,
                      text2: "28".tr,
                      onTap: () {
                        controllerLogin.goToSignUp();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
