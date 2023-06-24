class AddSheduleModel {
  DateTime dates;
  AddSheduleModel({required this.dates});
  factory AddSheduleModel.fromJson(Map<String, dynamic> json) =>
      AddSheduleModel(
        dates: json["dates"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates,
      };
}
