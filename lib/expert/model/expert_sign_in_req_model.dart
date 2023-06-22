class ExpertSignInReqModel {
  ExpertSignInReqModel({
    required this.mobile,
    required this.password,
  });

  String mobile;
  String password;

  factory ExpertSignInReqModel.fromJson(Map<String, dynamic> json) =>
      ExpertSignInReqModel(
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
      };
}
