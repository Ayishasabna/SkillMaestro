import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/all_users_services.dart';
import 'package:skillmaestro/admin/controller/block_user_service.dart';
import 'package:skillmaestro/application/admin/all_users_list_provider.dart';

class BlockUserProvider with ChangeNotifier {
  Map<String, dynamic> blockeduser = {};
  Map<String, dynamic> unBlockeduser = {};
  Future<Map<String, dynamic>> blockUser(id) async {
    blockeduser = await BlockUserService().blockUserId(id);
    log("----------------blockeduserstatusprovider---------$blockeduser");
    notifyListeners();
    toggleButtonText();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return blockeduser;
  }

  Future<Map<String, dynamic>> unBlockUser(id) async {
    unBlockeduser = await BlockUserService().unBlockUserId(id);
    log("----------------blockeduserstatusprovider---------$unBlockeduser['result']");
    notifyListeners();
    toggleButtonText();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return unBlockeduser;
  }

  void toggleButtonText() async {
    Map<String, dynamic> users = await AllUsersListProvider().fetchAllUsers();
    log("--------------blockuerprovide------------------$users");
  }
}
