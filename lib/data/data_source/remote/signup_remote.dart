import 'package:auth_front_end/core/api/links.dart';
import 'package:auth_front_end/core/crud/crud.dart';
import 'package:auth_front_end/data/data_model/user_model.dart';

class SignUpRemote {
  Crud crud;
  SignUpRemote(this.crud);

  signup(UserModel userModel) async {
    var response = await crud.postData(LinksApis.signupLink, {
      "userName": userModel.userName,
      "userAge": "23",
      "userEmail": userModel.userEmail,
      "userPassword": userModel.userPassword,
      "userPhone": userModel.userPhone
    });
    return response.fold((left) => left, (right) => right);
  }
}
