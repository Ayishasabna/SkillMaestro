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



/* class AllExpertsByAdmin {
  String username;
  String email;
  String mobile;
  String image;
  List<Skill> skills;
  List<String> slots;
  List<String> bookedSlots;
  Identity identity;
  List<int> rating;
  bool isBanned;
  bool isVerified;

  AllExpertsByAdmin({
    required this.username,
    required this.email,
    required this.mobile,
    required this.image,
    required this.skills,
    required this.slots,
    required this.bookedSlots,
    required this.identity,
    required this.rating,
    required this.isBanned,
    required this.isVerified,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'mobile': mobile,
      'image': image,
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'slots': slots,
      'bookedSlots': bookedSlots,
      'identity': identity.toJson(),
      'rating': rating,
      'isBanned': isBanned,
      'isVerified': isVerified,
    };
  }

  factory AllExpertsByAdmin.fromJson(Map<String, dynamic> json) {
    return AllExpertsByAdmin(
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      image: json['image'],
      skills: List<Skill>.from(json['skills'].map((x) => Skill.fromJson(x))),
      slots: List<String>.from(json['slots']),
      bookedSlots: List<String>.from(json['bookedSlots']),
      identity: Identity.fromJson(json['identity']),
      rating: List<int>.from(json['rating']),
      isBanned: json['isBanned'],
      isVerified: json['isVerified'],
    );
  }
}

class Skill {
  String id;
  String jobRole;
  String image;
  int baseRate;
  int addRate;
  bool listed;
  DateTime createdAt;
  DateTime updatedAt;

  Skill({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'job_role': jobRole,
      'image': image,
      'base_rate': baseRate,
      'add_rate': addRate,
      'listed': listed,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['_id'],
      jobRole: json['job_role'],
      image: json['image'],
      baseRate: json['base_rate'],
      addRate: json['add_rate'],
      listed: json['listed'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Identity {
  String name;
  String front;
  String back;
  String status;
  String reason;

  Identity({
    required this.name,
    required this.front,
    required this.back,
    required this.status,
    required this.reason,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'front': front,
      'back': back,
      'status': status,
      'reason': reason,
    };
  }

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      name: json['name'],
      front: json['front'],
      back: json['back'],
      status: json['status'],
      reason: json['reason'],
    );
  }
} */




/* class AllExpertsByAdmin {
  AllExpertsByAdmin({
    //  this.address,
    this.id,
    this.username,
    this.email,
    this.mobile,
    this.image,
    this.skills,
    this.slots,
    this.bookedSlots,
    this.identity,
    this.rating,
    this.isBanned,
    this.isVerified,
  });

  // Address? address;
  String? id;
  String? username;
  String? email;
  String? mobile;
  String? image;
  var skills;
  var slots;
  var bookedSlots;
  var identity;
  var rating;
  bool? isBanned;
  bool? isVerified;

  factory AllExpertsByAdmin.fromJson(Map<String, dynamic> json) =>
      AllExpertsByAdmin(
        // address: Address?.fromJson(json["address"]),
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        skills: json["skills"],
        slots: json["slots"],
        bookedSlots: json["bookedSlots"],
        identity: json["identity"],
        rating: json["rating"],
        isBanned: json["isBanned"],
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        // "address": address?.toJson(),
        "username": username,
        "email": email,
        "mobile": mobile,
        "image": image,
        "skill": skills,
        "slots": slots,
        "bookedSlots": bookedSlots,
        "identity": identity,
        "rating": rating,
        "isBanned": isBanned,
        "isVerified": isVerified,
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