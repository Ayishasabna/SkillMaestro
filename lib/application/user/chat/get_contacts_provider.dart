
import 'package:flutter/foundation.dart';
import 'package:skillmaestro/user/controller/get_contacts_service.dart';

class GetContactsProvider extends ChangeNotifier {
  Map<String, dynamic> contacts = {};
  Map<String, dynamic> users = {};

  Future getContactsExperts() async {
    contacts = await GetcontactsService().getContacts();

    notifyListeners();
  }

  Future getContactsUser() async {
    users = await GetcontactsService().getUserContacts();

    notifyListeners();
  }
}
