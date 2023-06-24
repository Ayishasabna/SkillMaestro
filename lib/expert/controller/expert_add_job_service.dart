import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/expert/model/expert_add_job_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../core/api/api_configuration.dart';

class ExpertAddJobService {
  Dio dio = Dio();
  // List<Skill> skillList = [];
  //FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> ExpertAddSkill(Set<String> skillIds) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addSkill;
    log("==========+++++++++=====00000000000000000000=========$path");
    try {
      String? token = await getExpertAccesToken();

      List<String> convertedIds =
          skillIds.map((id) => ObjectId.parse(id).toHexString()).toList();

      Map<String, dynamic> requestBody = {
        'skills': convertedIds,
      };
      /* List<dynamic> skillList = skillIds.toList();

      Map<String, dynamic> requestBody = {
        'skills': skillList,
      }; */

      Response response = await dio.post(path,
          data: jsonEncode(requestBody),
          options: Options(headers: {"authorization": "Bearer $token"}));
      log("==========+++++++++=====00000000000000000000=========${response.data}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data);
        if (responseData['status'] == 'success') {
          // Skill added successfully
          log('Skill added successfully!');
        } else {
          // Error occurred
          log('Error: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to add skill. Please try again.');
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return;
  }
}
