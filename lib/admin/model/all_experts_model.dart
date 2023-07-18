class AllExpertsByAdmin {
  final String status;
  final List<UserProfile> result;

  AllExpertsByAdmin({
    required this.status,
    required this.result,
  });

  factory AllExpertsByAdmin.fromJson(Map<String, dynamic> json) {
    return AllExpertsByAdmin(
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
  final List<dynamic> skills;
  final List<dynamic> slots;
  final List<dynamic> bookedSlots;
  final List<dynamic> rating;
  final bool isBanned;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
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
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["_id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      mobile: json["mobile"],
      skills: List<dynamic>.from(json["skills"]),
      slots: List<dynamic>.from(json["slots"]),
      bookedSlots: List<dynamic>.from(json["bookedSlots"]),
      rating: List<dynamic>.from(json["rating"]),
      isBanned: json["isBanned"],
      isVerified: json["isVerified"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}


