import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../core/api/api_configuration.dart';

class ExpertAddJobService {
  Dio dio = Dio();

  // ignore: non_constant_identifier_names
  Future<void> ExpertAddSkill(Set<String> skillIds) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addSkill;

    try {
      String? token = await getExpertAccesToken();

      List<String> convertedIds =
          skillIds.map((id) => ObjectId.parse(id).toHexString()).toList();

      Map<String, dynamic> requestBody = {
        'skills': convertedIds,
      };

      Response response = await dio.post(path,
          data: jsonEncode(requestBody),
          options: Options(headers: {"authorization": "Bearer $token"}));

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

  Future<void> removeExpertSkill(String id) async {
    String path =
        // ignore: prefer_interpolation_to_compose_strings
        ApiConfigration.baseUrl + ApiConfigration.removeSkill + "/$id";

    try {
      String? token = await getExpertAccesToken();

      Response response = await dio.get(path,
          // data: jsonEncode(id),
          options: Options(headers: {"authorization": "Bearer $token"}));

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
