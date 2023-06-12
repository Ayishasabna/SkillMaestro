class UserOtpModel {
  UserOtpModel({
    required this.mobile,
    required this.channel,
  });
  String mobile;
  String channel;

  factory UserOtpModel.fromJson(Map<String, dynamic> json) => UserOtpModel(
        mobile: json["To"],
        channel: json["Channel"],
      );

  Map<String, dynamic> toJson() => {
        "To": mobile,
        "Channel": channel,
      };
}
