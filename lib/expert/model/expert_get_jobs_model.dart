class JobRoleModel {
  final String id;
  final String jobRole;
  final String image;
  final int baseRate;
  final int addRate;
  final bool listed;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobRoleModel({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobRoleModel.fromJson(Map<String, dynamic> json) {
    return JobRoleModel(
      id: json['_id'],
      jobRole: json['job_role'],
      image: json['image'],
      baseRate: json['base_rate'],
      addRate: json['add_rate'],
      listed: json['listed'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'job_role': jobRole,
      'image': image,
      'base_rate': baseRate,
      'add_rate': addRate,
      'listed': listed,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
