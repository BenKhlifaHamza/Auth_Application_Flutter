import 'package:auth_front_end/core/api/links.dart';
import 'package:auth_front_end/core/crud/crud.dart';

class VerifyCodeSignUpRemote {
  Crud crud;
  VerifyCodeSignUpRemote(this.crud);

  verifyCodeSignUp(String email, String verifCode) async {
    var response = await crud.patchData(LinksApis.verifyCodeSignup,
        {"userEmail": email, "userVerifCode": verifCode});
    return response.fold((left) => left, (right) => right);
  }

  resendVeerifyCode(String email) async {
    var response =
        await crud.patchData(LinksApis.resendverifyCode, {"userEmail": email});
    return response.fold((left) => left, (right) => right);
  }
}
