import 'package:auth_front_end/core/api/links.dart';
import 'package:auth_front_end/core/crud/crud.dart';

class ResetPasswordRemote {
  Crud crud;
  ResetPasswordRemote(this.crud);

  resetPassword(String email, String password) async {
    var response = await crud.patchData(LinksApis.resetpassword,
        {"userEmail": email, "userPassword": password});
    return response.fold((left) => left, (right) => right);
  }
}
