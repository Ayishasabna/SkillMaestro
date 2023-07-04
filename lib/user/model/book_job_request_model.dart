class BookJobRequestModel {
  String slots;
  AddressModel address;
  String date;
  String jobId;

  BookJobRequestModel({
    required this.slots,
    required this.address,
    required this.date,
    required this.jobId,
  });

  factory BookJobRequestModel.fromJson(Map<String, dynamic> json) {
    return BookJobRequestModel(
      slots: json["slots"],
      //List<String>.from(json["slots"].map((x) => DateTime.parse(x))),
      address: AddressModel.fromJson(json["address"]),
      date: json["date"],
      jobId: json["jobId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "slots": slots,
      //List<dynamic>.from(slots.map((x) => x.toString())),
      "address": address.toJson(),
      "date": date,
      "jobId": jobId,
    };
  }
}

class AddressModel {
  String name;
  String house;
  String street;
  String pincode;

  AddressModel({
    required this.name,
    required this.house,
    required this.street,
    required this.pincode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json["name"],
      house: json["house"],
      street: json["street"],
      pincode: json["pincode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "house": house,
      "street": street,
      "pincode": pincode,
    };
  }
}
