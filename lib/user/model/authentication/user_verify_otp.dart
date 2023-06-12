class UserOtpVerifyModel {
  UserOtpVerifyModel({
    required this.mobile,
    required this.otp,
  });
  String mobile;
  int otp;

  factory UserOtpVerifyModel.fromJson(Map<String, dynamic> json) =>
      UserOtpVerifyModel(
        mobile: json["mobile"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
      };
}
