class ExpertSignUpResModel {
  final bool auth;
  final String experttoken;
  final User result;
  final String status;
  final String message;

  ExpertSignUpResModel({
    required this.auth,
    required this.experttoken,
    required this.result,
    required this.status,
    required this.message,
  });

  factory ExpertSignUpResModel.fromJson(Map<String, dynamic> json) {
    return ExpertSignUpResModel(
      auth: json['auth'],
      experttoken: json['experttoken'],
      result: User.fromJson(json['result']),
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auth': auth,
      'experttoken': experttoken,
      'result': result.toJson(),
      'status': status,
      'message': message,
    };
  }
}

class User {
  final Identity identity;
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
  final int v;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      identity: Identity.fromJson(json['identity']),
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      skills: List<dynamic>.from(json['skills']),
      slots: List<dynamic>.from(json['slots']),
      bookedSlots: List<dynamic>.from(json['bookedSlots']),
      rating: List<dynamic>.from(json['rating']),
      isBanned: json['isBanned'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identity': identity.toJson(),
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'mobile': mobile,
      'skills': skills,
      'slots': slots,
      'bookedSlots': bookedSlots,
      'rating': rating,
      'isBanned': isBanned,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Identity {
  final String status;

  Identity({required this.status});

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}

/* class ExpertSignUpResModel {
  final bool auth;
  final String expertToken;
  final User result;
  final String status;
  final String message;

  ExpertSignUpResModel({
    required this.auth,
    required this.expertToken,
    required this.result,
    required this.status,
    required this.message,
  });

  factory ExpertSignUpResModel.fromJson(Map<String, dynamic> json) {
    return ExpertSignUpResModel(
      auth: json['auth'],
      expertToken: json['experttoken'],
      result: User.fromJson(json['result']),
      status: json['status'],
      message: json['message'],
    );
  }
}

class User {
  final Identity identity;
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
  final int v;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      identity: Identity.fromJson(json['identity']),
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      mobile: json['mobile'],
      skills: List<dynamic>.from(json['skills']),
      slots: List<dynamic>.from(json['slots']),
      bookedSlots: List<dynamic>.from(json['bookedSlots']),
      rating: List<dynamic>.from(json['rating']),
      isBanned: json['isBanned'],
      isVerified: json['isVerified'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Identity {
  final String status;

  Identity({required this.status});

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      status: json['status'],
    );
  }
}


 */

/* class ExpertSignUpResModel {
  String sid;
  String serviceSid;
  String accountSid;
  String to;
  String channel;
  String status;
  bool valid;
  Lookup lookup;
  String? amount;
  String? payee;
  List<SendCodeAttempt> sendCodeAttempts;
  DateTime dateCreated;
  DateTime dateUpdated;
  String? sna;
  String url;

  ExpertSignUpResModel({
    required this.sid,
    required this.serviceSid,
    required this.accountSid,
    required this.to,
    required this.channel,
    required this.status,
    required this.valid,
    required this.lookup,
    required this.sendCodeAttempts,
    required this.dateCreated,
    required this.dateUpdated,
    this.amount,
    this.payee,
    this.sna,
    required this.url,
  });

  factory ExpertSignUpResModel.fromJson(Map<String, dynamic> json) {
    return ExpertSignUpResModel(
      sid: json['sid'],
      serviceSid: json['serviceSid'],
      accountSid: json['accountSid'],
      to: json['to'],
      channel: json['channel'],
      status: json['status'],
      valid: json['valid'],
      lookup: Lookup.fromJson(json['lookup']),
      amount: json['amount'],
      payee: json['payee'],
      sendCodeAttempts: List<SendCodeAttempt>.from(json['sendCodeAttempts']
          .map((attempt) => SendCodeAttempt.fromJson(attempt))),
      dateCreated: DateTime.parse(json['dateCreated']),
      dateUpdated: DateTime.parse(json['dateUpdated']),
      sna: json['sna'],
      url: json['url'],
    );
  }
}

class Lookup {
  dynamic carrier;

  Lookup({
    this.carrier,
  });

  factory Lookup.fromJson(Map<String, dynamic> json) {
    return Lookup(
      carrier: json['carrier'],
    );
  }
}

class SendCodeAttempt {
  String attemptSid;
  String channel;
  DateTime time;

  SendCodeAttempt({
    required this.attemptSid,
    required this.channel,
    required this.time,
  });

  factory SendCodeAttempt.fromJson(Map<String, dynamic> json) {
    return SendCodeAttempt(
      attemptSid: json['attempt_sid'],
      channel: json['channel'],
      time: DateTime.parse(json['time']),
    );
  }
} */





/* class ExpertSignUpResModel {
  ExpertSignUpResModel({
    required this.token,
  });

  String token;

  factory ExpertSignUpResModel.fromJson(Map<String, dynamic> json) =>
      ExpertSignUpResModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
} */
