class AllExpertsByAdmin {
  AllExpertsByAdmin({
    //  this.address,

    this.username,
    this.email,
    this.mobile,
    this.image,
    this.skill,
  });

  // Address? address;

  String? username;
  String? email;
  String? mobile;
  String? image;
  String? skill;

  factory AllExpertsByAdmin.fromJson(Map<String, dynamic> json) =>
      AllExpertsByAdmin(
        // address: Address?.fromJson(json["address"]),
        username: json["username"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        skill: json["skill"],
      );

  Map<String, dynamic> toJson() => {
        // "address": address?.toJson(),
        "username": username,
        "email": email,
        "mobile": mobile,
        "image": image,
        "skill": skill,
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
