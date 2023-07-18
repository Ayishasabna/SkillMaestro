import 'package:flutter/material.dart';
import '../../admin/controller/all_users_services.dart';

class AllUsersListProvider with ChangeNotifier {
  Map<String, dynamic> usersMap = {};
  Future<Map<String, dynamic>> fetchAllUsers() async {
    usersMap = await FetchAllUsersDetails().fetchAllUsersDetails();

    notifyListeners();

    return usersMap;
  }
}
