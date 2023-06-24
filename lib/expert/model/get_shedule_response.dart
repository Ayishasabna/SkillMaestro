import 'dart:convert';

GetScheduleModel welcomeFromJson(String str) =>
    GetScheduleModel.fromJson(json.decode(str));

String welcomeToJson(GetScheduleModel data) => json.encode(data.toJson());

class GetScheduleModel {
  String status;
  Result result;

  GetScheduleModel({
    required this.status,
    required this.result,
  });

  factory GetScheduleModel.fromJson(Map<String, dynamic> json) =>
      GetScheduleModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  String id;
  List<dynamic> slots;
  List<dynamic> bookedSlots;

  Result({
    required this.id,
    required this.slots,
    required this.bookedSlots,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        slots: List<dynamic>.from(json["slots"].map((x) => x)),
        bookedSlots: List<dynamic>.from(json["bookedSlots"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "slots": List<dynamic>.from(slots.map((x) => x)),
        "bookedSlots": List<dynamic>.from(bookedSlots.map((x) => x)),
      };
}
