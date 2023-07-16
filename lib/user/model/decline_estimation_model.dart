class DeclineEstimationModel {
  String id;
  String text;

  DeclineEstimationModel({
    required this.id,
    required this.text,
  });

  factory DeclineEstimationModel.fromJson(Map<String, dynamic> json) =>
      DeclineEstimationModel(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
