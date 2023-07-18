import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/job_detail_service.dart';
import 'package:skillmaestro/expert/model/end_job_model.dart';
import '../../expert/model/send_estimate_model.dart';

class ExpertJobProvider with ChangeNotifier {
  Future<void> sendEstimate(SendEstimateModel model) async {
    await JobDetailServioce().sendEstimate(model);

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void StartJob(String id) {
    JobDetailServioce().StartJob(id);
    //isLoading = value;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future EndJob(EndJobModel model) async {
    await JobDetailServioce().EndJob(model);

    //isLoading = value;
    notifyListeners();
  }

  
}
