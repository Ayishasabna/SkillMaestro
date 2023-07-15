import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/job_detail_service.dart';
import 'package:skillmaestro/expert/model/send_estimate_model.dart';

class JobDetailProvider with ChangeNotifier {
  //Future<ExpertProfileModel?>? expertDetails;

  Future<void> sendEstimate(SendEstimateModel model) async {
    log("____________________");
    JobDetailServioce().sendEstimate(model);
    // expertDetails = ExpertProfileService().ExpertProfile();
    notifyListeners();
  }

  // Future<void> editexpertProfile(EditExpertProfileModel editData) async {
  //   ExpertProfileService().editExpertProfile(editData);
  //   notifyListeners();
  // }
}
