class CancelBookingModel {
  String id;
  String text;

  CancelBookingModel({
    required this.id,
    required this.text,
  });

  factory CancelBookingModel.fromJson(Map<String, dynamic> json) =>
      CancelBookingModel(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
