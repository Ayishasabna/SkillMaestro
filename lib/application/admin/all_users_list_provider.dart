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

    return usersMap;
  }
}
