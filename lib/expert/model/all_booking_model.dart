class Bookingmodel {
  final User userId;
  final Expert expertId;
  final Job jobId;
  final int billAmount;
  final Address address;
  final String slot;
  final Estimate estimate;
  final Payment payment;
  final String status;
  final DateTime bookingDate;
  final DateTime jobStart;
  final DateTime jobEnd;
  final String reason;
  final String voucherId;
  final int discount;

  Bookingmodel({
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
}

class User {
  final bool auth;
  final Result result;
  final String token;

  User({
    required this.auth,
    required this.result,
    required this.token,
  });
}

class Result {
  final String username;
  final String email;
  final String mobile;
  final String image;
  final List<Address> address;
  final bool isBanned;
  final List<dynamic> vouchers;
  final int loyalty;

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
}

class Address {
  final String name;
  final String house;
  final String street;
  final int pincode;

  Address({
    required this.name,
    required this.house,
    required this.street,
    required this.pincode,
  });
}

class Expert {
  final String username;
  final String email;
  final String mobile;
  final String image;
  final List<Skill> skills;
  final List<String> slots;
  final List<String> bookedSlots;
  final Identity identity;
  final List<int> rating;
  final bool isBanned;
  final bool isVerified;

  Expert({
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
}

class Skill {
  final String id;
  final String jobRole;
  final String image;
  final int baseRate;
  final int addRate;
  final bool listed;
  final DateTime createdAt;
  final DateTime updatedAt;

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
}

class Identity {
  final String name;
  final String front;
  final String back;
  final String status;
  final String reason;

  Identity({
    required this.name,
    required this.front,
    required this.back,
    required this.status,
    required this.reason,
  });
}

class Estimate {
  final int hours;
  final List<Part> parts;
  final int amount;
  final String reason;
  final String status;

  Estimate(
      {required this.hours,
      required this.parts,
      required this.amount,
      required this.reason,
      required this.status});

  factory Estimate.fromJson(Map<String, dynamic> json) {
    return Estimate(
      hours: json['hours'],
      parts: List<Part>.from(json['parts'].map((part) => Part.fromJson(part))),
      amount: json['amount'],
      reason: json['reason'],
      status: json['status'],
    );
  }
}

class Part {
  final String pName;
  final int price;

  Part({required this.pName, required this.price});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      pName: json['pName'],
      price: json['price'],
    );
  }
}

class Payment {
  final String invoice;
  final String paymentMethod;
  final String paymentId;
  final String paymentStatus;

  Payment(
      {required this.invoice,
      required this.paymentMethod,
      required this.paymentId,
      required this.paymentStatus});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      invoice: json['invoice'],
      paymentMethod: json['payment_method'],
      paymentId: json['payment_id'],
      paymentStatus: json['payment_status'],
    );
  }
}

class Job {
  final Estimate estimate;
  final Payment payment;
  final String status;
  final String bookingDate;
  final String jobStart;
  final String jobEnd;
  final String reason;
  final String voucherId;
  final int discount;

  Job({
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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      estimate: Estimate.fromJson(json['estimate']),
      payment: Payment.fromJson(json['payment']),
      status: json['status'],
      bookingDate: json['booking_date'],
      jobStart: json['jobStart'],
      jobEnd: json['jobEnd'],
      reason: json['reason'],
      voucherId: json['voucherId'],
      discount: json['discount'],
    );
  }
}
