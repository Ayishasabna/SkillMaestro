import 'package:flutter/material.dart';
import '../../user/controller/get_contacts_service.dart';

class GetUserContactsProvider extends ChangeNotifier {
  Map<String, dynamic> users = {};

  Future getContactsUser() async {
    users = await GetcontactsService().getUserContacts();

    notifyListeners();
  }
}
