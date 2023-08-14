import 'package:get/get.dart';

validateInput(int maxLength, int minLength, String type, String value) {
  if (value.isEmpty) {
    return "15".tr;
  }

  if (value.length > maxLength) {
    return "${"20".tr} $maxLength";
  }

  if (value.length < minLength) {
    return "${"16".tr} $minLength";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "21".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "17".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "18".tr;
    }
  }

  if (type == "password") {
    RegExp userPasswordRegExp = RegExp(r'^[a-zA-Z0-9]{3,30}$');
    if (!userPasswordRegExp.hasMatch(value)) {
      return "19".tr;
    }
  }

  if (type == "age") {
    if (int.parse(value) < 18) {
      return "29".tr;
    }
  }
}
