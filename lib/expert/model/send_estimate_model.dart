class SendEstimateModel {
  String bookId;
  final num hours;
  final List<Part> parts;
  final num amount;

  SendEstimateModel({
    required this.bookId,
    required this.hours,
    required this.parts,
    required this.amount,
  });

  factory SendEstimateModel.fromJson(Map<String, dynamic> json) {
    return SendEstimateModel(
      bookId: json['bookId'],
      hours: json['hours'],
      parts: List<Part>.from(json['parts'].map((part) => Part.fromJson(part))),
      amount: json['amount'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'hours': hours,
      'parts': parts,
      'amount': amount,
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

