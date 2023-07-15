class EndJobModel {
  String bookId;
  final num hours;
  final List<Part> parts;
  final num total;

  EndJobModel({
    required this.bookId,
    required this.hours,
    required this.parts,
    required this.total,
  });

  factory EndJobModel.fromJson(Map<String, dynamic> json) {
    return EndJobModel(
      bookId: json['bookId'],
      hours: json['hours'],
      parts: List<Part>.from(json['parts'].map((part) => Part.fromJson(part))),
      total: json['total'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'hours': hours,
      'parts': parts,
      'total': total,
    };
  }
}

class Part {
  final String pName;
  final int price;

  Part({required this.pName, required this.price});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      pName: json['pName'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'pName': pName,
      'price': price,
    };
  }
}
