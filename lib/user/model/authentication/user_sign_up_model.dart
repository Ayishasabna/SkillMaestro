class UserSignUpModel {
  UserSignUpModel({
    required this.username,
    required this.email,
    required this.mobile,
    required this.password,
  });

  String username;
  String email;
  String mobile;
  String password;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      UserSignUpModel(
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
/* "username": "haig",
  "email"  :"haiag@gmail.com" ,
  "password" :"haijjjj",
  "mobile" :"9746048135" */