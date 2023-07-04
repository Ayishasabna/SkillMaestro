import 'dart:convert';

AddAddressModel welcomeFromJson(String str) =>
    AddAddressModel.fromJson(json.decode(str));

String welcomeToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  String name;
  String house;
  String street;
  String pincode;

  AddAddressModel({
    required this.name,
    required this.house,
    required this.street,
    required this.pincode,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
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
