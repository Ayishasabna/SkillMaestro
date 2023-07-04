import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/model/add_adress_model.dart';

class AddAddressProvider with ChangeNotifier {
  //Map<String, dynamic> JobsMap = {};
  Future AddAddress(AddAddressModel model, context) async {
    await FetchJobs().AddUserAddress(model, context);
    log("----------------jobsMap---------");
    notifyListeners();
  }
}
