import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/expert_managing.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class ExpertManagementService {
  Dio dio = Dio();

  Future<String?> approveExpert(expertId) async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getExperts +
        expertId;

    ExpertApprovelModel id = ExpertApprovelModel(id: expertId);
    final token = await getAdminAccesToken();

    try {
      Response response = await dio.post(path,
          data: jsonEncode(id.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        return 'success';
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<void> blockExpert(context, expertId) async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.blockExpert +
        expertId;

    ExpertBlockModel id = ExpertBlockModel(id: expertId);
    final token = getAdminAccesToken();

    try {
      Response response = await dio.post(path,
          data: jsonEncode(id.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: 'Blocking Vendor Successfull',
          ),
        );
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
