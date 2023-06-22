class ExpertSignUpModel {
  ExpertSignUpModel({
    required this.username,
    required this.email,
    required this.mobile,
    required this.password,
  });

  String username;
  String email;
  String mobile;
  String password;

  factory ExpertSignUpModel.fromJson(Map<String, dynamic> json) =>
      ExpertSignUpModel(
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "mobile": mobile,
        "password": password,
      };
}
