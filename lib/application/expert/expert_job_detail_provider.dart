import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/job_detail_service.dart';
import 'package:skillmaestro/expert/model/end_job_model.dart';

class ExpertJobProvider with ChangeNotifier {
  //List<JobModel>? expertJobs = [];
  //bool isLoading = false;
  void StartJob(String id) {
    JobDetailServioce().StartJob(id);
    //isLoading = value;
    notifyListeners();
  }

  Future EndJob(EndJobModel model) async {
    await JobDetailServioce().EndJob(model);
    //isLoading = value;
    notifyListeners();
  }

  /* Future<void> callApiServiceJobs(context) async {
    FetchJobs().fetch7Jobs().then((value) {
      expertJobs = value.cast<JobModel>();
      notifyListeners();
    });
  } */
}