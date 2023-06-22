import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/add_job_req_model.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';

class ShowAllJobsProvider with ChangeNotifier {
  List<JobModel>? expertJobs = [];
  bool isLoading = false;
  void loadingState(value) {
    isLoading = value;
    notifyListeners();
  }

  /* Future<void> callApiServiceJobs(context) async {
    FetchJobs().fetch7Jobs().then((value) {
      expertJobs = value.cast<JobModel>();
      notifyListeners();
    });
  } */
}
