class UserSignUpResModel {
  final bool auth;
  final String token;
  final User result;
  final String status;
  final String message;

  UserSignUpResModel({
    required this.auth,
    required this.token,
    required this.result,
    required this.status,
    required this.message,
  });

  factory UserSignUpResModel.fromJson(Map<String, dynamic> json) {
    return UserSignUpResModel(
      auth: json['auth'],
      token: json['token'],
      result: User.fromJson(json['result']),
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auth': auth,
      'token': token,
      'result': result.toJson(),
      'status': status,
      'message': message,
    };
  }
}

class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String mobile;
  final bool isBanned;
  final List<dynamic> vouchers;
  final int loyalty;
  final List<dynamic> address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.id,
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
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      isBanned: json['isBanned'],
      vouchers: List<dynamic>.from(json['vouchers']),
      loyalty: json['loyality'],
      address: List<dynamic>.from(json['address']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'mobile': mobile,
      'isBanned': isBanned,
      'vouchers': vouchers,
      'loyality': loyalty,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}



