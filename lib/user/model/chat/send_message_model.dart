class SendMessageModel {
  String from;
  String to;
  String message;
  String model;

  SendMessageModel({
    required this.from,
    required this.to,
    required this.message,
    required this.model,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        from: json["from"],
        to: json["to"],
        message: json["message"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "message": message,
        "model": model,
      };
}
