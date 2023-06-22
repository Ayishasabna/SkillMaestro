class AdminSignInResModel {
  AdminSignInResModel({
    required this.token,
  });

  String token;

  factory AdminSignInResModel.fromJson(Map<String, dynamic> json) =>
      AdminSignInResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
