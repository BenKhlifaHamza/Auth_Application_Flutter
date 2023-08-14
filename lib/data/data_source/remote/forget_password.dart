import 'package:auth_front_end/core/api/links.dart';
import 'package:auth_front_end/core/crud/crud.dart';

class ForgetPasswordRemote {
  Crud crud;
  ForgetPasswordRemote(this.crud);

  forgetPassword(String email) async {
    var response =
        await crud.patchData(LinksApis.forgetPassword, {"userEmail": email});
    return response.fold((left) => left, (right) => right);
  }
}
