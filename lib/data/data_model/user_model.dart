class UserModel {
  String? sId;
  String? userName;
  String? userAge;
  String? userAprv;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  String? userVerifCode;
  String? userCreate;

  UserModel(
      {this.sId,
      this.userName,
      this.userAge,
      this.userAprv,
      this.userEmail,
      this.userPassword,
      this.userPhone,
      this.userVerifCode,
      this.userCreate});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    userAge = json['userAge'].toString();
    userAprv = json['userAprv'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    userPhone = json['userPhone'];
    userVerifCode = json['userVerifCode'];
    userCreate = json['userCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['userAge'] = userAge;
    data['userAprv'] = userAprv;
    data['userEmail'] = userEmail;
    data['userPassword'] = userPassword;
    data['userPhone'] = userPhone;
    data['userVerifCode'] = userVerifCode;
    data['userCreate'] = userCreate;
    return data;
  }
}
