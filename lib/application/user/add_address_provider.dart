import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/model/add_adress_model.dart';

class AddAddressProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  Future AddAddress(AddAddressModel model, context) async {
    await FetchJobs().AddUserAddress(model, context);

    notifyListeners();
  }
}
