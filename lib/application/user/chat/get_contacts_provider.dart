import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:skillmaestro/user/controller/get_contacts_service.dart';

class GetContactsProvider extends ChangeNotifier {
  Map<String, dynamic> contacts = {};
  Map<String, dynamic> users = {};

  Future getContactsExperts() async {
    contacts = await GetcontactsService().getContacts();
    log("----------------contacts Provider---------${contacts}");
    notifyListeners();
  }

  Future getContactsUser() async {
    log("_________________contacts user Provider________________________");
    users = await GetcontactsService().getUserContacts();
    log("----------------contacts user Provider---------${users}");
    notifyListeners();
  }
}
