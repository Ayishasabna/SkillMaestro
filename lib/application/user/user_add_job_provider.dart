import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/model/add_job_req_model.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/model/book_job_request_model.dart';

class UserAddJobProvider with ChangeNotifier {
  //Map<String, dynamic> JobsMap = {};
  Future AddJob(BookJobRequestModel model, context) async {
    await FetchJobs().BookJob(model, context);
    log("----------------jobsMap---------");
    notifyListeners();
  }
}
