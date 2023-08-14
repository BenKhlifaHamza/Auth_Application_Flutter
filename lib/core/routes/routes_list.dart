import 'package:auth_front_end/core/middleware/middleware.dart';
import 'package:auth_front_end/core/routes/routes_names.dart';
import 'package:auth_front_end/views/pages/forget_password.dart';
import 'package:auth_front_end/views/pages/home.dart';
import 'package:auth_front_end/views/pages/language.dart';
import 'package:auth_front_end/views/pages/login.dart';
import 'package:auth_front_end/views/pages/onboarding.dart';
import 'package:auth_front_end/views/pages/reset_pasword.dart';
import 'package:auth_front_end/views/pages/signup.dart';
import 'package:auth_front_end/views/pages/success_signup.dart';
import 'package:auth_front_end/views/pages/verify_code_forget.dart';
import 'package:auth_front_end/views/pages/verify_code_signup.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routesList = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(
    name: RoutesNames.loginPage,
    page: () => const Login(),
  ),
  GetPage(
    name: RoutesNames.onBoardingPage,
    page: () => const Onboarding(),
  ),
  GetPage(
    name: RoutesNames.homePage,
    page: () => const Home(),
  ),
  GetPage(
    name: RoutesNames.signUpPage,
    page: () => const SignUp(),
  ),
  GetPage(
    name: RoutesNames.varifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage(
    name: RoutesNames.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: RoutesNames.forgetPassWord,
    page: () => const ForgetPassWord(),
  ),
  GetPage(
    name: RoutesNames.verifyCodeForget,
    page: () => const VerifyCodeForget(),
  ),
  GetPage(
    name: RoutesNames.resetPassword,
    page: () => const ResetPassword(),
  ),
];
