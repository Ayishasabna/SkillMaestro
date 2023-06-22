class ExpertOtpVerifyModel {
  ExpertOtpVerifyModel({
    required this.mobile,
    required this.otp,
  });
  String mobile;
  String otp;

  factory ExpertOtpVerifyModel.fromJson(Map<String, dynamic> json) =>
      ExpertOtpVerifyModel(
        mobile: json["mobile"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
      };
}
