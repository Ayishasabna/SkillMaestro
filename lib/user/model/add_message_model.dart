class ChatMessageModel {
  String from;
  String to;
  String message;
  String model;

  ChatMessageModel({
    required this.from,
    required this.to,
    required this.message,
    required this.model,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
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
