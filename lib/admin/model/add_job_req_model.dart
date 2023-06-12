import 'dart:io';

class AddJobReqModel {
  AddJobReqModel(
      {required this.job,
      required this.bRate,
      required this.adRate,
      this.image});

  String job;
  int bRate;
  int adRate;
  File? image;

  factory AddJobReqModel.fromJson(Map<String, dynamic> json) => AddJobReqModel(
      job: json["job"],
      bRate: json["brate"],
      adRate: json["adRate"],
      image: json["image"]);

  Map<String, dynamic> toJson() =>
      {"job": job, "bRate": bRate, "adRate": adRate, "image": image};
}
