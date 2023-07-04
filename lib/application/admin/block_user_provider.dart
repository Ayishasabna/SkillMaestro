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

    return blockeduser;
  }

  Future<Map<String, dynamic>> unBlockUser(id) async {
    unBlockeduser = await BlockUserService().unBlockUserId(id);
    log("----------------unblockeduserstatusprovider---------$unBlockeduser['result']");
    notifyListeners();

    return unBlockeduser;
  }

  Future<String> toggleButtonText(bool result) async {
    String buttonText;
    Map<String, dynamic> users = await AllUsersListProvider().fetchAllUsers();
    log("--------------blockuerprovide------------------$users");
    if (result) {
      buttonText = 'UnBlock';
    } else {
      buttonText = 'Block';
    }
    notifyListeners();
    return buttonText;
  }
}
