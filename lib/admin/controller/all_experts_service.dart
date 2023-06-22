import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/all_experts_model.dart';

class FetchAllExpertsDetails {
  Dio dio = Dio();

  Map<String, dynamic> experts = {};
  Future<Map<String, dynamic>> fetchAllExpertsDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getExperts;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        experts = response.data;
        log('======usersjsondecode=======${experts}');

        return experts;
      }
    } catch (e) {}
    return experts;
  }
/*   Future<List<AllExpertsByAdmin>?> fetchAllExpertsDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getExperts;

    String path1 = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.adminAuth;

    String? token = await getAdminAccesToken();
    log("Inside admin controllerallexperts${token}");

    try {
      Response res = await dio.get(path1,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (res.statusCode == 200 || res.statusCode == 201) {
        Response response = await dio.get(path,
            options: Options(headers: {"authorization": "Bearer $token"}));

        log("inside response 200${response.data}");

        if (response.data is Map<String, dynamic>) {
          final List<AllExpertsByAdmin> allExperts = [
            AllExpertsByAdmin.fromJson(response.data)
          ];
          log("allExperts.toString()::::$allExperts");
          return allExperts;
        } else if (response.data is List<dynamic>) {
          final List<AllExpertsByAdmin> allExperts =
              (response.data['results'] as List<dynamic>)
                  .map((e) => AllExpertsByAdmin.fromJson(e))
                  .toList();
          log("allExperts.toString()::::$allExperts");
          return allExperts;
        } else {
          throw Exception("Invalid response data format");
        }
      }

      /*  final List<AllExpertsByAdmin> allExperts = (response.data as List)
            .map((e) => AllExpertsByAdmin.fromJson(e))
            .toList();
        log("allExperts.toString()::::$allExperts");
        return allExperts;
      } */
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  } */
}
