// To parse this JSON data, do
//
//     final showSingleBookingDetailsModel = showSingleBookingDetailsModelFromJson(jsonString);

import 'dart:convert';

ShowSingleBookingDetailsModel showSingleBookingDetailsModelFromJson(
        String str) =>
    ShowSingleBookingDetailsModel.fromJson(json.decode(str));

String showSingleBookingDetailsModelToJson(
        ShowSingleBookingDetailsModel data) =>
    json.encode(data.toJson());

class ShowSingleBookingDetailsModel {
  String status;
  Result result;

  ShowSingleBookingDetailsModel({
    required this.status,
    required this.result,
  });

  factory ShowSingleBookingDetailsModel.fromJson(Map<String, dynamic> json) =>
      ShowSingleBookingDetailsModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  Address address;
  Estimate estimate;
  Payment payment;
  String id;
  UserId userId;
  ExpertId expertId;
  JobId jobId;
  DateTime slot;
  String status;
  DateTime bookingDate;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DateTime jobStart;
  int billAmount;
  DateTime jobEnd;

  Result({
    required this.address,
    required this.estimate,
    required this.payment,
    required this.id,
    required this.userId,
    required this.expertId,
    required this.jobId,
    required this.slot,
    required this.status,
    required this.bookingDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.jobStart,
    required this.billAmount,
    required this.jobEnd,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        address: Address.fromJson(json["address"]),
        estimate: Estimate.fromJson(json["estimate"]),
        payment: Payment.fromJson(json["payment"]),
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        expertId: ExpertId.fromJson(json["expertId"]),
        jobId: JobId.fromJson(json["jobId"]),
        slot: DateTime.parse(json["slot"]),
        status: json["status"],
        bookingDate: DateTime.parse(json["booking_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        jobStart: DateTime.parse(json["jobStart"]),
        billAmount: json["bill_amount"],
        jobEnd: DateTime.parse(json["jobEnd"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "estimate": estimate.toJson(),
        "payment": payment.toJson(),
        "_id": id,
        "userId": userId.toJson(),
        "expertId": expertId.toJson(),
        "jobId": jobId.toJson(),
        "slot": slot.toIso8601String(),
        "status": status,
        "booking_date": bookingDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "jobStart": jobStart.toIso8601String(),
        "bill_amount": billAmount,
        "jobEnd": jobEnd.toIso8601String(),
      };
}

class Address {
  String name;
  String house;
  String street;
  int pincode;
  String? id;

  Address({
    required this.name,
    required this.house,
    required this.street,
    required this.pincode,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        house: json["house"],
        street: json["street"],
        pincode: json["pincode"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "house": house,
        "street": street,
        "pincode": pincode,
        "_id": id,
      };
}

class Estimate {
  String reason;
  int hours;
  String status;
  List<dynamic> parts;

  Estimate({
    required this.reason,
    required this.hours,
    required this.status,
    required this.parts,
  });

  factory Estimate.fromJson(Map<String, dynamic> json) => Estimate(
        reason: json["reason"],
        hours: json["hours"],
        status: json["status"],
        parts: List<dynamic>.from(json["parts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "hours": hours,
        "status": status,
        "parts": List<dynamic>.from(parts.map((x) => x)),
      };
}

class ExpertId {
  Identity identity;
  String id;
  String username;
  String email;
  String mobile;
  List<String> skills;
  List<DateTime> slots;
  List<DateTime> bookedSlots;
  List<dynamic> rating;
  bool isBanned;
  bool isVerified;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ExpertId({
    required this.identity,
    required this.id,
    required this.username,
    required this.email,
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

  factory ExpertId.fromJson(Map<String, dynamic> json) => ExpertId(
        identity: Identity.fromJson(json["identity"]),
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        slots: List<DateTime>.from(json["slots"].map((x) => DateTime.parse(x))),
        bookedSlots: List<DateTime>.from(
            json["bookedSlots"].map((x) => DateTime.parse(x))),
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
        "mobile": mobile,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "slots": List<dynamic>.from(slots.map((x) => x.toIso8601String())),
        "bookedSlots":
            List<dynamic>.from(bookedSlots.map((x) => x.toIso8601String())),
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

class JobId {
  String id;
  String jobRole;
  String image;
  int baseRate;
  int addRate;
  bool listed;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  JobId({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
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
        v: json["__v"],
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
        "__v": v,
      };
}

class Payment {
  String paymentStatus;
  String invoice;

  Payment({
    required this.paymentStatus,
    required this.invoice,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentStatus: json["payment_status"],
        invoice: json["invoice"],
      );

  Map<String, dynamic> toJson() => {
        "payment_status": paymentStatus,
        "invoice": invoice,
      };
}

class UserId {
  String id;
  String username;
  String email;
  String mobile;
  bool isBanned;
  List<dynamic> vouchers;
  int loyality;
  List<Address> address;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserId({
    required this.id,
    required this.username,
    required this.email,
    required this.mobile,
    required this.isBanned,
    required this.vouchers,
    required this.loyality,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        isBanned: json["isBanned"],
        vouchers: List<dynamic>.from(json["vouchers"].map((x) => x)),
        loyality: json["loyality"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "mobile": mobile,
        "isBanned": isBanned,
        "vouchers": List<dynamic>.from(vouchers.map((x) => x)),
        "loyality": loyality,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
