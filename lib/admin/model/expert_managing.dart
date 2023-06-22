class ExpertApprovelModel {
  ExpertApprovelModel({
    required this.id,
  });

  String id;

  factory ExpertApprovelModel.fromJson(Map<String, dynamic> json) =>
      ExpertApprovelModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class ExpertBlockModel {
  ExpertBlockModel({
    required this.id,
  });

  String id;

  factory ExpertBlockModel.fromJson(Map<String, dynamic> json) =>
      ExpertBlockModel(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
