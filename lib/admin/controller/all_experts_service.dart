import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/theme/access_token/token.dart';
import '../model/all_experts_model.dart';

class FetchAllExpertsDetails {
  Dio dio = Dio();
  Future<List<AllExpertsByAdmin>?> fetchAllVendorsDetails() async {
    /* String path = ApiConfigration.kBaseUrl +
        ApiConfigration.admin +
        ApiConfigration.fetchAllVendors; */
    String path = 'http:/ 10.4.1.200:4000/admin/getExperts';
    String? token = await getAdminAccesToken();
    log(token);

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final List<AllExpertsByAdmin> allVendors =
            (response.data["data"]["vendors"] as List)
                .map((e) => AllExpertsByAdmin.fromJson(e))
                .toList();
        log(allVendors.toString());
        return allVendors;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
