import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/all_users_model.dart';

import '../../admin/controller/all_users_services.dart';

class AllUsersListProvider with ChangeNotifier {
  Map<String, dynamic> usersMap = {};
  Future<Map<String, dynamic>> fetchAllUsers() async {
    usersMap = await FetchAllUsersDetails().fetchAllUsersDetails();
    log("----------------usersMap---------$usersMap");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return usersMap;
  }
}


/* class AllUsersListForAdmin with ChangeNotifier {
  //List<AllUsersByAdmin?>? allUsers;
  Map<String, dynamic> usersMap = {};
  //List<UserProfile> resultList = [];
  //List<String> usernameList = [];

  //String? result;
  Future<List<dynamic>> fetchAllUsers() async {
    FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      usersList = value;
      //allUsers = value;
      // = value;
      log(allUsers.toString(), name: 'allusers');
      // Extract result and username from the list of users
      //resultList = allUsers?.map((user) => user['result'].toString()).toList() ?? [];
      /* resultList =
          allUsers?.map((user) => user?['result']?.toString() ?? '').toList() ??
              []; */
      /* resultList =
          allUsers?.map((user) => user?['result']?.toString() ?? '').toList() ??
              []; */
      //Map<String, dynamic> responseData = allUsers;
      //List<dynamic> usersList = allUsers?.values?.last?.toList();
      List<dynamic> usersList =
          allUsers?.map((user) => user?.result).toList() ?? [];

      // List<UserProfile> resultList = allUsers
      //         ?.map((user) => user?.result ?? [])
      //         .expand((result) => result)
      //         .toList() ??
      //     [];

      /* List<UserProfile> resultList =
          allUsers?.map((user) => user?['result'] as UserProfile).toList() ??
              []; */

      // List<Map<String, dynamic>> userProfilePropertiesList =
      //     resultList.map((user) {
      //   return {
      //     'id': user.id,
      //     'username': user.username,
      //     'email': user.email,
      //     'password': user.password,
      //     'mobile': user.mobile,
      //     'isBanned': user.isBanned,
      //     'image': user.image,
      //     'vouchers': user.vouchers,
      //     'loyalty': user.loyalty,
      //     'address': user.address,
      //     'createdAt': user.createdAt,
      //     'updatedAt': user.updatedAt,
      //   };
      // }).toList();

      /*  List<String> usernameList = resultList.map((result) {
        Map<String, dynamic> json = jsonDecode(result);
        UserProfile userProfile = UserProfile.fromJson(json);
        return userProfile.username;
      }).toList(); */
      //usernameList = resultList.map((result) => result['username']?.toString() ?? '').toList() ?? [];

/* 
     List<String> usernameList = resultList.map((result) {
  return result['username'].toString();
}).toList(); */

      /* ---------   List<String> usernameList = resultList.map((result) {
        return result.toString();
      }).toList(); */

      /*  usernameList = resultList
          .map((user) => user?['username']?.toString() ?? '')
          .toList(); */

      // List<String> usernameList = resultList.map((username) {
      //   Map<String, dynamic> json = jsonDecode(username);
      //   return json['username'].toString();
      // }).toList();

      /* List<String> usernameList = resultList
          .map((result) => result['username']?.toString() ?? '')
          .toList(); */

      //usernameList = resultList?.map((user) => user['username'].toString()?? '').toList() ?? [];

      // Log the extracted values
      // log(resultList.toString(), name: 'result');
      // log(usernameList.toString(), name: 'username');
      //itemList = allUsers?.whereType<UserProfile>().toList() ?? [];
      //itemList = allUsers?.map((user) => user?.result ?? '')?.toList() ?? [];

      return usersList;
    });

    //FetchAllUsersDetails().fetchAllUsersDetails().then((value) {});
    log("---------------usersList-------------$usersList");
    return usersList;
  }

  /* Future<void> approveExpert(expertId) async {
    result = await ExpertManagementService().approveExpert(expertId);

    notifyListeners();
  } */
} */
