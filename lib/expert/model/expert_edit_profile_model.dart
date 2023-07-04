class EditExpertProfileModel {
  String? name;
  String? email;

  EditExpertProfileModel({
    this.name,
    this.email,
  });

  factory EditExpertProfileModel.fromJson(Map<String, dynamic> json) =>
      EditExpertProfileModel(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
