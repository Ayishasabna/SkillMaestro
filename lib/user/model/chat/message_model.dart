/* class GetMessageModel {
  GetMessageModel({
    this.myself,
    this.message,
    this.time,
  });

  bool? myself;
  String? message;
  String? time;

  factory GetMessageModel.fromJson(Map<String, dynamic> json) =>
      GetMessageModel(
        myself: json["myself"],
        message: json["message"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "myself": myself,
        "message": message,
        "time": time,
      };
}
 */

/* class MessageModel {
  String? sendBy;
  String? message;
  bool? seen;
  //FieldValue? createdOn;

  MessageModel(
      {required this.sendBy, required this.seen, required this.message});

  MessageModel.fromMap(Map<String, dynamic> map) {
    sendBy = map["sendBy"];
    message = map["message"];
    seen = map["seen"];
    //createdOn = map["createdon"].toDate();
  }

  Map<String, dynamic> tojson() {
    return {
      "sendBy": sendBy,
      "message": message,
      "seen": seen,
      //"createdon":createdOn
    };
  }
}

class MessageModelTwo {
  String? sendBy;
  bool? seen;
  String? message;
  DateTime? createdOn;

  MessageModelTwo(
      {required this.sendBy, required this.message, this.createdOn, this.seen});
  MessageModelTwo.fromJson(Map<String, dynamic> json) {
    sendBy = json["sendBy"];
    seen = json["seen"];
    message = json["message"];
    createdOn = json["createdOn"];
  }

  Map<String, dynamic> toJson() {
    return {
      "sendBy": sendBy,
      "seen": seen,
      "message": message,
      "createdOn": createdOn,
    };
  }
}

class MessageModel2 {
  String? from;
  String? to;
  String? message;

  MessageModel2({required this.from, required this.to, required this.message});

  MessageModel2.fromMap(Map<String, dynamic> map) {
    from = map["from"];
    message = map["message"];
    to = map["to"];
  }

  Map<String, dynamic> tojson() {
    return {
      "from": from,
      "message": message,
      "to": to,
    };
  }
} */
