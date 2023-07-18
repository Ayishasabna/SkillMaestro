import 'dart:convert';

AllUsersByAdmin dataModelFromJson(String str) =>
    AllUsersByAdmin.fromJson(json.decode(str));

String dataModelToJson(AllUsersByAdmin data) => json.encode(data.toJson());

class AllUsersByAdmin {
  String status;
  List<Result> result;

  AllUsersByAdmin({
    required this.status,
    required this.result,
  });

  factory AllUsersByAdmin.fromJson(Map<String, dynamic> json) =>
      AllUsersByAdmin(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
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
}




