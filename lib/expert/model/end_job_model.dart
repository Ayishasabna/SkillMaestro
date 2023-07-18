class EndJobModel {
  String id;
  num hours;
  List<Part> parts;
  num total;

  EndJobModel({
    required this.id,
    required this.hours,
    required this.parts,
    required this.total,
  });

  factory EndJobModel.fromJson(Map<String, dynamic> json) => EndJobModel(
        id: json["id"],
        hours: json["hours"],
        parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hours": hours,
        "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
        "total": total,
      };
}

class Part {
  String pName;
  int price;
  String id;

  Part({
    required this.pName,
    required this.price,
    required this.id,
  });

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        pName: json["pName"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "pName": pName,
        "price": price,
        "_id": id,
      };
}


