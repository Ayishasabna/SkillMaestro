class ExpertAddJobModel {
  Skill skills;

  ExpertAddJobModel({required this.skills});
  factory ExpertAddJobModel.fromJson(Map<String, dynamic> json) =>
      ExpertAddJobModel(
        skills: json["skills"],
      );

  Map<String, dynamic> toJson() => {
        "skills": skills,
      };
}

class Skill {
  final String id;
  final String jobRole;
  final String image;
  final int baseRate;
  final int addRate;
  final bool listed;
  final DateTime createdAt;
  final DateTime updatedAt;

  Skill({
    required this.id,
    required this.jobRole,
    required this.image,
    required this.baseRate,
    required this.addRate,
    required this.listed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["_id"],
        jobRole: json["jobRole"],
        image: json["image"],
        baseRate: json["baseRate"],
        addRate: json["addRate"],
        listed: json["listed"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "jobRole": jobRole,
        "image": image,
        "baseRate": baseRate,
        "addRate": addRate,
        "listed": listed,
        "createdAt": createdAt,
        "updatedAt": updatedAt
      };
}
