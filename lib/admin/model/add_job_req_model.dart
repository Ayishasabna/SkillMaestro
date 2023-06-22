/* import 'dart:io';

import 'package:dio/dio.dart';

class AddJobReqModel {
  AddJobReqModel({
    required this.job,
    required this.bRate,
    required this.adRate,
    required this.image,
  });

  String job;
  int bRate;
  int adRate;
  File? image;

  factory AddJobReqModel.fromFormData(FormData formData, {
    required String jobFieldKey,
    required String bRateFieldKey,
    required String adRateFieldKey,
    required String imageFieldKey,
  }) {
    return AddJobReqModel(
      job: formData.fields
          .singleWhere((entry) => entry.key == jobFieldKey, orElse: () => MapEntry(jobFieldKey, '')).value,
      bRate: int.parse(formData.fields
          .singleWhere((entry) => entry.key == bRateFieldKey, orElse: () => MapEntry(bRateFieldKey, '0')).value),
      adRate: int.parse(formData.fields
          .singleWhere((entry) => entry.key == adRateFieldKey, orElse: () => MapEntry(adRateFieldKey, '0')).value),
      image: formData.files
          .singleWhere((entry) => entry.key == imageFieldKey, orElse: () => MapEntry(imageFieldKey, null))
          .value
          ?.file,
    );
  }

  factory AddJobReqModel.fromJson(Map<String, dynamic> json) {
    return AddJobReqModel(
      job: json['job'],
      bRate: json['bRate'],
      adRate: json['adRate'],
      image: json['image'] != null ? File(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job,
      'bRate': bRate,
      'adRate': adRate,
      'image': image?.path,
    };
  }
}



 */

import 'dart:io';

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

  /*  factory AddJobReqModel.fromFormData(FormData formData, {
    required String job,
    required String bRate,
    required String adRate,
    required String image,
  })  */

  /* {
    
    return AddJobReqModel(
      job: formData.fields
          .singleWhere((entry) => entry.key == job, orElse: () => MapEntry(job, '')).value,
      bRate: int.parse(formData.fields
          .singleWhere((entry) => entry.key == bRate, orElse: () => MapEntry(bRate, '0')).value),
      adRate: int.parse(formData.fields
          .singleWhere((entry) => entry.key == adRate, orElse: () => MapEntry(adRate, '0')).value),
      image: formData.fields.singleWhere((entry) => entry.key==image, orElse: () => MapEntry(image,null)).value    

    /*   image: formData.files.isNotEmpty && formData.files.any((entry) => entry.key == image)
    ? File(formData.files.singleWhere((entry) => entry.key == image).value.path)
    : null, */
    );
  } */

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
  /*  Map<String, dynamic> toJson() =>
      {"job": job, "bRate": bRate, "adRate": adRate, "image": image};

  factory JobModel.fromJson(Map<dynamic, dynamic> json) => JobModel(
      job: json["job"],
      bRate: json["brate"],
      adRate: json["adRate"],
      image: json["image"]); */
}
