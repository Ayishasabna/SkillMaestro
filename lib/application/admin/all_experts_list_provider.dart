import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/all_experts_service.dart';
import 'package:skillmaestro/admin/controller/experts_managing_service.dart';
import 'package:skillmaestro/admin/model/all_experts_model.dart';

class AllExpertListForAdmin with ChangeNotifier {
  Map<String, dynamic> expert = {};
  Future<Map<String, dynamic>> fetchAllExperts() async {
    expert = await FetchAllExpertsDetails().fetchAllExpertsDetails();
    log("----------------jobsMap---------$expert");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return expert;
  }
  /* List<AllExpertsByAdmin>? allExperts;
  String? result;
  Future<void> fetchAllExperts() async {
    log("insideallexperts provider");
    FetchAllExpertsDetails().fetchAllExpertsDetails().then((value) {
      allExperts = value;
      log(allExperts.toString(), name: 'allexperts');
      notifyListeners();
    });
  }

  Future<void> approveExpert(expertId) async {
    result = await ExpertManagementService().approveExpert(expertId);

    notifyListeners();
  } */
}
