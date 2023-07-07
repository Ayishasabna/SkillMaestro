class GetMessageModel {
  bool fromSelf;
  String message;
  String createdAt;

  GetMessageModel({
    required this.fromSelf,
    required this.message,
    required this.createdAt,
  });

  factory GetMessageModel.fromJson(Map<String, dynamic> json) =>
      GetMessageModel(
        fromSelf: json["fromSelf"],
        message: json["message"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "fromSelf": fromSelf,
        "message": message,
        "createdAt": createdAt,
      };
}
