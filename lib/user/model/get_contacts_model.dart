class GetContactsModel {
  String status;
  List<Result> result;

  GetContactsModel({
    required this.status,
    required this.result,
  });

  factory GetContactsModel.fromJson(Map<String, dynamic> json) =>
      GetContactsModel(
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
  String id;
  String email;
  String username;
  String mobile;
  dynamic image;
  List<Booking> bookings;

  Result({
    required this.id,
    required this.email,
    required this.username,
    required this.mobile,
    this.image,
    required this.bookings,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        mobile: json["mobile"],
        image: json["image"],
        bookings: List<Booking>.from(
            json["bookings"].map((x) => Booking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "mobile": mobile,
        "image": image,
        "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
      };
}

class Booking {
  String bookingId;

  Booking({
    required this.bookingId,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        bookingId: json["bookingId"],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
      };
}
