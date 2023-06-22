import 'dart:convert';

class JobListModel {
  final String status;
  final List<jobProfile> result;

  JobListModel({
    required this.status,
    required this.result,
  });

  factory JobListModel.fromJson(Map<String, dynamic> json) {
    return JobListModel(
      status: json["status"],
      result: List<jobProfile>.from(
          json["result"].map((x) => jobProfile.fromJson(x))),
    );
  }
}

class jobProfile {
  final String id;
  final String jobRole;
  final String image;
  final int baseRate;
  final int addRate;
  final bool isListed;
  final DateTime createdAt;
  final DateTime updatedAt;

  jobProfile({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.isListed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory jobProfile.fromJson(Map<String, dynamic> json) {
    return jobProfile(
      id: json["_id"],
      jobRole: json["job_role"],
      image: json["image"],
      baseRate: json["base_rate"],
      addRate: json["add_rate"],
      isListed: json["listed"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}



/* class JobListModel {
  final String id;
  final String jobRole;
  final String image;
  final int baseRate;
  final int addRate;
  final bool isListed;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobListModel({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.isListed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobListModel.fromJson(Map<String, dynamic> json) {
    return JobListModel(
      id: json["_id"],
      jobRole: json["job_role"],
      image: json["image"],
      baseRate: json["base_rate"],
      addRate: json["add_rate"],
      isListed: json["listed"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
 */