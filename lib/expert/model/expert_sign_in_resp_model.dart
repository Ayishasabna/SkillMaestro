class ExpertSignInResModel {
  bool auth;
  String experttoken;
  Result result;
  String status;

  ExpertSignInResModel({
    required this.auth,
    required this.experttoken,
    required this.result,
    required this.status,
  });

  factory ExpertSignInResModel.fromJson(Map<String, dynamic> json) =>
      ExpertSignInResModel(
        auth: json["auth"],
        experttoken: json["experttoken"],
        result: Result.fromJson(json["result"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "experttoken": experttoken,
        "result": result.toJson(),
        "status": status,
      };
}

class Result {
  Identity identity;
  String id;
  String username;
  String email;
  String password;
  String mobile;
  List<dynamic> skills;
  List<dynamic> slots;
  List<dynamic> bookedSlots;
  List<dynamic> rating;
  bool isBanned;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        identity: Identity.fromJson(json["identity"]),
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        slots: List<dynamic>.from(json["slots"].map((x) => x)),
        bookedSlots: List<dynamic>.from(json["bookedSlots"].map((x) => x)),
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
        isBanned: json["isBanned"],
        isVerified: json["isVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "identity": identity.toJson(),
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "mobile": mobile,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "slots": List<dynamic>.from(slots.map((x) => x)),
        "bookedSlots": List<dynamic>.from(bookedSlots.map((x) => x)),
        "rating": List<dynamic>.from(rating.map((x) => x)),
        "isBanned": isBanned,
        "isVerified": isVerified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Identity {
  String status;

  Identity({
    required this.status,
  });

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}


