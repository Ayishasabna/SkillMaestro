class ReviewModel {
  String reviewBy;
  String myId;
  String reviewModel;
  String myIdModel;
  String jobId;
  String bookId;
  String message;
  num rating;

  ReviewModel({
    required this.reviewBy,
    required this.myId,
    required this.reviewModel,
    required this.myIdModel,
    required this.jobId,
    required this.bookId,
    required this.message,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviewBy: json["reviewBy"],
        myId: json["myId"],
        reviewModel: json["reviewModel"],
        myIdModel: json["myIdModel"],
        jobId: json["jobId"],
        bookId: json["bookId"],
        message: json["message"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "reviewBy": reviewBy,
        "myId": myId,
        "reviewModel": reviewModel,
        "myIdModel": myIdModel,
        "jobId": jobId,
        "bookId": bookId,
        "message": message,
        "rating": rating,
      };
}
