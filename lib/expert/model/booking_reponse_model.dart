class GetBooking {
  String status;
  List<Result> result;

  GetBooking({
    required this.status,
    required this.result,
  });

  factory GetBooking.fromJson(Map<String, dynamic> json) => GetBooking(
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
  Address address;
  Estimate estimate;
  Payment payment;
  String id;
  String userId;
  String expertId;
  JobId jobId;
  DateTime slot;
  String status;
  DateTime bookingDate;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

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
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        address: Address.fromJson(json["address"]),
        estimate: Estimate.fromJson(json["estimate"]),
        payment: Payment.fromJson(json["payment"]),
        id: json["_id"],
        userId: json["userId"],
        expertId: json["expertId"],
        jobId: JobId.fromJson(json["jobId"]),
        slot: DateTime.parse(json["slot"]),
        status: json["status"],
        bookingDate: DateTime.parse(json["booking_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "estimate": estimate.toJson(),
        "payment": payment.toJson(),
        "_id": id,
        "userId": userId,
        "expertId": expertId,
        "jobId": jobId.toJson(),
        "slot": slot.toIso8601String(),
        "status": status,
        "booking_date": bookingDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
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
  String status;
  List<dynamic> parts;

  Estimate({
    required this.hours,
    required this.status,
    required this.parts,
  });

  factory Estimate.fromJson(Map<String, dynamic> json) => Estimate(
        hours: json["hours"],
        status: json["status"],
        parts: List<dynamic>.from(json["parts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hours": hours,
        "status": status,
        "parts": List<dynamic>.from(parts.map((x) => x)),
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

  Payment({
    required this.paymentStatus,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentStatus: json["payment_status"],
      );

  Map<String, dynamic> toJson() => {
        "payment_status": paymentStatus,
      };
}
