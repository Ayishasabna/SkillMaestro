// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GetSlotesResponseModel welcomeFromJson(String str) =>
    GetSlotesResponseModel.fromJson(json.decode(str));

String welcomeToJson(GetSlotesResponseModel data) => json.encode(data.toJson());

class GetSlotesResponseModel {
  String status;
  List<DateTime> result;
  Job job;

  GetSlotesResponseModel({
    required this.status,
    required this.result,
    required this.job,
  });

  factory GetSlotesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetSlotesResponseModel(
        status: json["status"],
        result:
            List<DateTime>.from(json["result"].map((x) => DateTime.parse(x))),
        job: Job.fromJson(json["job"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toIso8601String())),
        "job": job.toJson(),
      };
}

class Job {
  String id;
  String jobRole;
  String image;
  int baseRate;
  int addRate;
  bool listed;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Job({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        jobRole: json["job_role"],
        image: json["image"],
        baseRate: json["base_rate"],
        addRate: json["add_rate"],
        listed: json["listed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "job_role": jobRole,
        "image": image,
        "base_rate": baseRate,
        "add_rate": addRate,
        "listed": listed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
