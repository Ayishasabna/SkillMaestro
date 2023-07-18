import 'package:dio/dio.dart';

var formData = FormData();

class AddJobReqModel {
  AddJobReqModel(
      {required this.job,
      required this.bRate,
      required this.adRate,
      required this.image});

  String job;
  int bRate;
  int adRate;
  String? image;

  factory AddJobReqModel.fromJson(Map<dynamic, dynamic> json) => AddJobReqModel(
      job: json["job"],
      bRate: json["brate"],
      adRate: json["adRate"],
      image: json["image"]);

  Map<String, dynamic> toJson() =>
      {"job": job, "bRate": bRate, "adRate": adRate, "image": image};
}

class JobModel {
  final String job;
  final int bRate;
  final int adRate;

  JobModel({
    required this.job,
    required this.adRate,
    required this.bRate,
  });
}
