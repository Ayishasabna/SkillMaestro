class UserSignInReqModel {
  UserSignInReqModel({
    required this.mobile,
    required this.password,
  });

  String mobile;
  String password;

  factory UserSignInReqModel.fromJson(Map<String, dynamic> json) =>
      UserSignInReqModel(
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
      };
}
