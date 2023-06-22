class ExpertOtpResponseModel {
  bool auth;
  String experttoken;
  ResultModel result;
  String status;
  String message;

  ExpertOtpResponseModel({
    required this.auth,
    required this.experttoken,
    required this.result,
    required this.status,
    required this.message,
  });

  factory ExpertOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return ExpertOtpResponseModel(
      auth: json['auth'],
      experttoken: json['experttoken'],
      result: ResultModel.fromJson(json['result']),
      status: json['status'],
      message: json['message'],
    );
  }
}

class ResultModel {
  IdentityModel identity;
  String id;
  String username;
  String email;
  String password;
  String mobile;
  List<String> skills;
  List<String> slots;
  List<String> bookedSlots;
  List<dynamic> rating;
  bool isBanned;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ResultModel({
    required this.identity,
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.mobile,
    required this.skills,
    required this.slots,
    required this.bookedSlots,
    required this.rating,
    required this.isBanned,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      identity: IdentityModel.fromJson(json['identity']),
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      skills: List<String>.from(json['skills']),
      slots: List<String>.from(json['slots']),
      bookedSlots: List<String>.from(json['bookedSlots']),
      rating: List<dynamic>.from(json['rating']),
      isBanned: json['isBanned'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class IdentityModel {
  String status;

  IdentityModel({required this.status});

  factory IdentityModel.fromJson(Map<String, dynamic> json) {
    return IdentityModel(status: json['status']);
  }
}
