import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:skillmaestro/user/controller/get_contacts_service.dart';

class GetContactsProvider extends ChangeNotifier {
  Map<String, dynamic> contacts = {};
  Future getContactsExperts() async {
    contacts = await GetcontactsService().getContacts();
    log("----------------contacts Provider---------${contacts}");
    notifyListeners();
  }
}
