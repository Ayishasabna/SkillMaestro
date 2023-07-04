import 'dart:convert';

List<BookJobModel> welcomeFromJson(String str) => List<BookJobModel>.from(
    json.decode(str).map((x) => BookJobModel.fromJson(x)));

String welcomeToJson(List<BookJobModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookJobModel {
  UserId userId;
  ExpertId expertId;
  JobId jobId;
  int billAmount;
  Address address;
  String slot;
  Estimate estimate;
  Payment payment;
  String status;
  DateTime bookingDate;
  DateTime jobStart;
  DateTime jobEnd;
  String reason;
  String voucherId;
  int discount;

  BookJobModel({
    required this.userId,
    required this.expertId,
    required this.jobId,
    required this.billAmount,
    required this.address,
    required this.slot,
    required this.estimate,
    required this.payment,
    required this.status,
    required this.bookingDate,
    required this.jobStart,
    required this.jobEnd,
    required this.reason,
    required this.voucherId,
    required this.discount,
  });

  factory BookJobModel.fromJson(Map<String, dynamic> json) => BookJobModel(
        userId: UserId.fromJson(json["userId"]),
        expertId: ExpertId.fromJson(json["expertId"]),
        jobId: JobId.fromJson(json["jobId"]),
        billAmount: json["bill_amount"],
        address: Address.fromJson(json["address"]),
        slot: json["slot"],
        estimate: Estimate.fromJson(json["estimate"]),
        payment: Payment.fromJson(json["payment"]),
        status: json["status"],
        bookingDate: DateTime.parse(json["booking_date"]),
        jobStart: DateTime.parse(json["jobStart"]),
        jobEnd: DateTime.parse(json["jobEnd"]),
        reason: json["reason"],
        voucherId: json["voucherId"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId.toJson(),
        "expertId": expertId.toJson(),
        "jobId": jobId.toJson(),
        "bill_amount": billAmount,
        "address": address.toJson(),
        "slot": slot,
        "estimate": estimate.toJson(),
        "payment": payment.toJson(),
        "status": status,
        "booking_date": bookingDate.toIso8601String(),
        "jobStart": jobStart.toIso8601String(),
        "jobEnd": jobEnd.toIso8601String(),
        "reason": reason,
        "voucherId": voucherId,
        "discount": discount,
      };
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        house: json["house"],
        street: json["street"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "house": house,
        "street": street,
        "pincode": pincode,
      };
}

class Estimate {
  int hours;
  List<Part> parts;
  int amount;
  String reason;
  String status;

  Estimate({
    required this.hours,
    required this.parts,
    required this.amount,
    required this.reason,
    required this.status,
  });

  factory Estimate.fromJson(Map<String, dynamic> json) => Estimate(
        hours: json["hours"],
        parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
        amount: json["amount"],
        reason: json["reason"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
        "amount": amount,
        "reason": reason,
        "status": status,
      };
}

class Part {
  String pName;
  int price;

  Part({
    required this.pName,
    required this.price,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        pName: json["pName"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "pName": pName,
        "price": price,
      };
}

class ExpertId {
  String username;
  String email;
  String mobile;
  String image;
  List<JobId> skills;
  List<String> slots;
  List<String> bookedSlots;
  Identity identity;
  List<int> rating;
  bool isBanned;
  bool isVerified;

  ExpertId({
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

  factory ExpertId.fromJson(Map<String, dynamic> json) => ExpertId(
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        skills: List<JobId>.from(json["skills"].map((x) => JobId.fromJson(x))),
        slots: List<String>.from(json["slots"].map((x) => x)),
        bookedSlots: List<String>.from(json["bookedSlots"].map((x) => x)),
        identity: Identity.fromJson(json["identity"]),
        rating: List<int>.from(json["rating"].map((x) => x)),
        isBanned: json["isBanned"],
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "mobile": mobile,
        "image": image,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "slots": List<dynamic>.from(slots.map((x) => x)),
        "bookedSlots": List<dynamic>.from(bookedSlots.map((x) => x)),
        "identity": identity.toJson(),
        "rating": List<dynamic>.from(rating.map((x) => x)),
        "isBanned": isBanned,
        "isVerified": isVerified,
      };
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

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        name: json["name"],
        front: json["front"],
        back: json["back"],
        status: json["status"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "front": front,
        "back": back,
        "status": status,
        "reason": reason,
      };
}

class JobId {
  String id;
  String jobRole;
  String image;
  int baseRate;
  int addRate;
  bool listed;
  DateTime createdAt;
  DateTime updatedAt;

  JobId({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobId.fromJson(Map<String, dynamic> json) => JobId(
        id: json["_id"],
        jobRole: json["job_role"],
        image: json["image"],
        baseRate: json["base_rate"],
        addRate: json["add_rate"],
        listed: json["listed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "job_role": jobRole,
        "image": image,
        "base_rate": baseRate,
        "add_rate": addRate,
        "listed": listed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Payment {
  String invoice;
  String paymentMethod;
  String paymentId;
  String paymentStatus;

  Payment({
    required this.invoice,
    required this.paymentMethod,
    required this.paymentId,
    required this.paymentStatus,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        invoice: json["invoice"],
        paymentMethod: json["payment_method"],
        paymentId: json["payment_id"],
        paymentStatus: json["payment_status"],
      );

  Map<String, dynamic> toJson() => {
        "invoice": invoice,
        "payment_method": paymentMethod,
        "payment_id": paymentId,
        "payment_status": paymentStatus,
      };
}

class UserId {
  bool auth;
  Result result;
  String token;

  UserId({
    required this.auth,
    required this.result,
    required this.token,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        auth: json["auth"],
        result: Result.fromJson(json["result"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "result": result.toJson(),
        "token": token,
      };
}

class Result {
  String username;
  String email;
  String mobile;
  String image;
  List<Address> address;
  bool isBanned;
  List<Voucher> vouchers;
  int loyality;

  Result({
    required this.username,
    required this.email,
    required this.mobile,
    required this.image,
    required this.address,
    required this.isBanned,
    required this.vouchers,
    required this.loyality,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        isBanned: json["isBanned"],
        vouchers: List<Voucher>.from(
            json["vouchers"].map((x) => Voucher.fromJson(x))),
        loyality: json["loyality"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "mobile": mobile,
        "image": image,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "isBanned": isBanned,
        "vouchers": List<dynamic>.from(vouchers.map((x) => x.toJson())),
        "loyality": loyality,
      };
}

class Voucher {
  Voucher();

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher();

  Map<String, dynamic> toJson() => {};
}
