import 'package:auth_front_end/core/api/links.dart';
import 'package:auth_front_end/core/crud/crud.dart';

class LoginRemote {
  Crud crud;
  LoginRemote(this.crud);

  login(String email, String password) async {
    var response = await crud.postData(
        LinksApis.loginLink, {"userEmail": email, "userPassword": password});
    return response.fold((left) => left, (right) => right);
  }
}
