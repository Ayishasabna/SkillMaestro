import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/user/model/review_model.dart';

import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class AddReveiwService {
  Dio dio = Dio();
  Future<void> addReveiw(ReviewModel reveiwData) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addReview;
    final token = await getUserAccesToken();
    log("______________-bookId_____________${reveiwData.bookId}");
    log("______________-jobId_____________${reveiwData.jobId}");
    log("______________-message_____________${reveiwData.message}");
    log("______________-myId_____________${reveiwData.myId}");
    log("______________-myIdModel_____________${reveiwData.myIdModel}");
    log("______________-reviewBy_____________${reveiwData.reviewBy}");
    log("______________-reviewModel_____________${reveiwData.reviewModel}");
    log("______________-rating_____________${reveiwData.rating}");
    try {
      Response response = await dio.post(path,
          data: jsonEncode(reveiwData.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));
      log("____________________post ratingllllllllll________");
      if (response.statusCode == 200) {
        log(("_____________________success____________"));
        log("review adding success");
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
