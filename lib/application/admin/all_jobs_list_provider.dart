import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/all_jobs_service.dart';
import 'package:skillmaestro/admin/model/all_jobs_response_model.dart';

class AllJobsListForAdmin with ChangeNotifier {
  Map<String, dynamic> JobsMap = {};
  Future<Map<String, dynamic>> fetchAllJobs() async {
    JobsMap = await FetchAllJobDetails().fetchAllJobsDetails();
    log("----------------jobsMap---------$JobsMap");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return JobsMap;
  }
  /* List<JobListModel>? allJobs;

  String? result;

  List<jobProfile>? get allJobProfiles {
    if (allJobs != null) {
      List<jobProfile> profiles = [];
      for (var jobListModel in allJobs!) {
        profiles.addAll(jobListModel.result);
      }
      return profiles;
    }
    return null;
  }

  Future<void> fetchAllJobs() async {
    log("insidealljobs provider");
    FetchAllJobDetails().fetchAllJobsDetails().then((value) {
      allJobs = value;
      log(allJobs.toString(), name: 'allJobs');
      notifyListeners();
    });
  }

  /*  Future<void> approveExpert(expertId) async {
    result = await ExpertManagementService().approveExpert(expertId);

    notifyListeners();
  } */ */
}
