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

    try {
      Response response = await dio.post(path,
          data: jsonEncode(reveiwData.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        log("review adding success");
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
