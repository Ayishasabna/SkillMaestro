/* class UserSignInResModel {
  bool auth;
  String token;
  Result result;
  String status;

  UserSignInResModel({
    required this.auth,
    required this.token,
    required this.result,
    required this.status,
  });

  factory UserSignInResModel.fromJson(Map<String, dynamic> json) =>
      UserSignInResModel(
        auth: json["auth"],
        token: json["token"],
        result: Result.fromJson(json["result"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "result": result.toJson(),
        "status": status,
      };
}

class Result {
  String id;
  String username;
  String email;
  String password;
  String mobile;
  bool isBanned;
  List<dynamic> vouchers;
  int loyality;
  List<dynamic> address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Result({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.mobile,
    required this.isBanned,
    required this.vouchers,
    required this.loyality,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        isBanned: json["isBanned"],
        vouchers: List<dynamic>.from(json["vouchers"].map((x) => x)),
        loyality: json["loyality"],
        address: List<dynamic>.from(json["address"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "mobile": mobile,
        "isBanned": isBanned,
        "vouchers": List<dynamic>.from(vouchers.map((x) => x)),
        "loyality": loyality,
        "address": List<dynamic>.from(address.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
} */

class UserSignInResModel {
  UserSignInResModel({
    required this.token,
  });

  String? token;

  factory UserSignInResModel.fromJson(Map<String, dynamic> json) =>
      UserSignInResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class UserIdModel {
  UserIdModel({
    required this.id,
  });

  String id;

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
