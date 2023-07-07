import 'dart:convert';

ChartModel chartModelFromJson(String str) =>
    ChartModel.fromJson(json.decode(str));

String chartModelToJson(ChartModel data) => json.encode(data.toJson());

class ChartModel {
  String status;
  Result result;

  ChartModel({
    required this.status,
    required this.result,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  List<PieDatum> pieData;
  List<dynamic> result;

  Result({
    required this.pieData,
    required this.result,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pieData: List<PieDatum>.from(
            json["pieData"].map((x) => PieDatum.fromJson(x))),
        result: List<dynamic>.from(json["result"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pieData": List<dynamic>.from(pieData.map((x) => x.toJson())),
        "result": List<dynamic>.from(result.map((x) => x)),
      };
}

class PieDatum {
  String id;
  int expertCount;

  PieDatum({
    required this.id,
    required this.expertCount,
  });

  factory PieDatum.fromJson(Map<String, dynamic> json) => PieDatum(
        id: json["_id"],
        expertCount: json["expert_count"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "expert_count": expertCount,
      };
}
