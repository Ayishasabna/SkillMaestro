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




/* import 'dart:convert';

class AllUsersByAdmin {
  final String status;
  final List<UserProfile> result;

  AllUsersByAdmin({
    required this.status,
    required this.result,
  });

  dynamic operator [](String key) {
    switch (key) {
      case 'result':
        return result;
      /* case 'username':
        return username; */
      default:
        throw Exception('Invalid key: $key');
    }
  }

  factory AllUsersByAdmin.fromJson(Map<String, dynamic> json) {
    return AllUsersByAdmin(
      status: json["status"],
      result: List<UserProfile>.from(
          json["result"].map((x) => UserProfile.fromJson(x))),
    );
  }
}

class UserProfile {
  final String id;
  final String username;
  final String email;
  final String password;
  final String mobile;
  final bool isBanned;
  final String? image;
  final List<dynamic> vouchers;
  final int loyalty;
  final List<dynamic> address;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.mobile,
      required this.isBanned,
      required this.vouchers,
      required this.loyalty,
      required this.address,
      required this.createdAt,
      required this.updatedAt,
      this.image});

  /* ynamic operator [](String key) {
    switch (key) {
      case 'username':
        return username;
      default:
        throw Exception('Invalid key: $key');
    }
  } */

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["_id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      mobile: json["mobile"],
      image: json["image"],
      isBanned: json["isBanned"],
      vouchers: List<dynamic>.from(json["vouchers"]),
      loyalty: json["loyality"],
      address: List<dynamic>.from(json["address"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
 */


/* class AllUsersByAdmin {
  bool auth;
  Result result;
  String token;

  AllUsersByAdmin({
    required this.auth,
    required this.result,
    required this.token,
  });

  factory AllUsersByAdmin.fromJson(Map<String, dynamic> json) {
    return AllUsersByAdmin(
      auth: json['auth'],
      result: Result.fromJson(json['result']),
      token: json['token'],
    );
  }
}

class Result {
  String username;
  String email;
  String mobile;
  String image;
  List<Address> address;
  bool isBanned;
  List<dynamic> vouchers;
  int loyalty;

  Result({
    required this.username,
    required this.email,
    required this.mobile,
    required this.image,
    required this.address,
    required this.isBanned,
    required this.vouchers,
    required this.loyalty,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      image: json['image'],
      address:
          List<Address>.from(json['address'].map((x) => Address.fromJson(x))),
      isBanned: json['isBanned'],
      vouchers: List<dynamic>.from(json['vouchers'].map((x) => x)),
      loyalty: json['loyality'],
    );
  }
}

class Address {
  String name;
  String house;
  String street;
  int pincode;

  Address({
    required this.name,
    required this.house,
    required this.street,
    required this.pincode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      house: json['house'],
      street: json['street'],
      pincode: json['pincode'],
    );
  }
} */


/* AllUsersByAdmin response = AllUsersByAdmin.fromJson(jsonDecode(jsonString));
print(response.result.username);  // Output: string
print(response.result.email);     // Output: user@example.com
print(response.result.address[0].name); */  // Output: string




/* class AllUsersByAdmin {
  AllUsersByAdmin({
    //  this.address,
    this.id,
    this.auth,
    this.result,
    this.token,
  });

  // Address? address;
  String? id;
  bool? auth;
  List? result;
  String? token;

  factory AllUsersByAdmin.fromJson(Map<String, dynamic> json) =>
      AllUsersByAdmin(
        // address: Address?.fromJson(json["address"]),
        id: json["_id"],
        auth: json["auth"],
        result: json["result"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        // "address": address?.toJson(),
        "id": id,
        "auth": auth,
        "result": result,
        "token": token,
      };
}

class Address {
  Address({
    required this.city,
    required this.country,
    required this.currentAddress,
    required this.pincode,
    required this.state,
  });

  String city;
  String country;
  String currentAddress;
  int pincode;
  String state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        country: json["country"],
        currentAddress: json["currentAddress"],
        pincode: json["pincode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "currentAddress": currentAddress,
        "pincode": pincode,
        "state": state,
      };
}
 */