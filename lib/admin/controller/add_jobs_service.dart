import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:skillmaestro/application/admin/add_job_provider.dart';
import '../../common/widgets/bottom_nav_bar.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/add_job_req_model.dart';

class AddJobService {
  String path =
      ApiConfigration.baseUrl + ApiConfigration.admin + ApiConfigration.addJobs;
  Dio dio = Dio();

  Future<void> sendMultipartRequest(
      BuildContext context, File imageFile, JobModel jobmodel) async {
    try {
      String? token = await getAdminAccesToken();
      String getFileExtension(String filePath) {
        return filePath.split('.').last;
      }

      MediaType getMediaType(String extension) {
        switch (extension) {
          case 'jpg':
            return MediaType('image', 'jpg');
          case 'png':
            return MediaType('image', 'png');
          case 'gif':
            return MediaType('image', 'gif');
          // Add more cases for other file formats as needed
          default:
            return MediaType('application', 'octet-stream');
        }
      }

      String fileExtension = getFileExtension(imageFile.path);
      MediaType contentType = getMediaType(fileExtension);

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          contentType: contentType,
          //MediaType('image', 'jpg')
        ),
        'job': jobmodel.job,
        "bRate": jobmodel.bRate,
        "adRate": jobmodel.adRate
      });
      log("--------------${imageFile.path}");

      var response = await dio.post(path,
          data: formData,
          options: Options(headers: {
            "authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          }));
      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        checkAddJob(context);
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> checkAddJob(context) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
        (route) => false);
  }
}

/*   Future<void> addJob(AddJobReqModel newJobName) async {
    log('---------------------------');
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.addJobs;

    String path1 = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.adminAuth;

    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await getAdminAccesToken();
    //String? token = await storage.read(key: 'admin_access_token');
    log("admin token  :::::${token}");
    //String? tokenData = token!.replaceAll('"', '');
    //log(token);
    try {
      Response res = await dio.get(path1,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (res.statusCode == 200 || res.statusCode == 201) {
        print('inside add job service');
        Response response = await dio.post(path,
            data: jsonEncode(newJobName.toJson()),
            options: Options(headers: {"authorization": "Bearer$token"}));

        log(response.data.toString());
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  } */

