import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/add_job_req_model.dart';

class ShowAllJobsProvider with ChangeNotifier {
  List<JobModel>? expertJobs = [];
  bool isLoading = false;
  void loadingState(value) {
    isLoading = value;
    notifyListeners();
  }
}
