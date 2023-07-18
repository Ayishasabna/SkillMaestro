
import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/model/book_job_request_model.dart';

class UserAddJobProvider with ChangeNotifier {
  
  // ignore: non_constant_identifier_names
  Future AddJob(BookJobRequestModel model, context) async {
    await FetchJobs().BookJob(model, context);
    
    notifyListeners();
  }
}
