import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/admin/model/all_users_model.dart';
import 'package:skillmaestro/admin/view/users_list.dart';

import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class FetchAllUsersDetails {
  Dio dio = Dio();
  Map<String, dynamic> users = {};
  Future<Map<String, dynamic>> fetchAllUsersDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getUsers;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        users = response.data;
        log('======usersjsondecode=======${users}');

        return users;
      }
    } catch (e) {}
    return users;
  }
}
 /*  Future<Map<String,dynamic>> fetchAllUsersDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getUsers;
    String path1 = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.adminAuth;

    String? token = await getAdminAccesToken();
    log(token);

    try {
      Response res = await dio.get(path1,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (res.statusCode == 200 || res.statusCode == 201) {
        Response response = await dio.get(path,
            options: Options(headers: {"authorization": "Bearer $token"}));

        log("------fetchallusersdatails 200--------${response.data}");

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = response.data;

         /*  List<dynamic> usersList = responseData.values.last.toList();
          log("---------userslist----------${usersList}");
          //final users = jsonDecode(usersList) as List;

          final users = usersList.map((e) {
            return Result(
                id: e['_id'],
                username: e['username'],
                email: e['email'],
                password: e['password'],
                mobile: e['mobile'],
                isBanned: e['isBanned'],
                vouchers: e['vouchers'],
                loyality: e['loyality'],
                address: e['address'],
                createdAt: e['createdAt'],
                updatedAt: e['updatedAt'],
                v: e['__v']);
            // Result(id: e['id'], username: e['username'], email: e['email'], password: e['password'], mobile: e['mobile'], isBanned: e['isBanned'], vouchers: e['vouchers'], loyality: ['loyality'], address: ['address'], createdAt: ['createdAt'], updatedAt: ['updatedAt'])
          }).toList();
          log('------------------------users-------${users}'); */
          return responseData;

          /* DataModel dataModelFromJson(String str) =>
              DataModel.fromJson(json.decode(str)); */
          /* AllUsersByAdmin usersList =
              AllUsersByAdmin.fromJson(json.decode(response.data)); */
          //log("-----------jsonusersList------${usersList}");
          //final users = json.map((e) => {}).toList();
        }
        throw "something went Wrong";
        //Map<String, dynamic> responseData = response.data;

        //List<dynamic> usersList = responseData.values.last.toList();

        /*   if (response.data is Map<String, dynamic>) {
          final List<AllUsersByAdmin> allUsers = [
            AllUsersByAdmin.fromJson(response.data)
          ];
          log("allUsers.toString()::::$allUsers");
          return allUsers;
        } else if (response.data is List<dynamic>) {
          final List<AllUsersByAdmin> allUsers =
              (response.data['results'] as List<dynamic>)
                  .map((e) => AllUsersByAdmin.fromJson(e))
                  .toList();
          log("allUsers.toString()::::$allUsers");
          return allUsers;
        } else {
          throw Exception("Invalid response data format");
        } */
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
    
  }
}
 */