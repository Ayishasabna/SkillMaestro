import 'dart:developer';

import 'package:flutter/material.dart';

import '../../user/controller/get_contacts_service.dart';

class GetUserContactsProvider extends ChangeNotifier {
  Map<String, dynamic> users = {};

  Future getContactsUser() async {
    log("_________________contacts user Provider________________________");
    users = await GetcontactsService().getUserContacts();
    log("----------------contacts user Provider---------${users}");
    notifyListeners();
  }
}
