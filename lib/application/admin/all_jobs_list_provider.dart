
import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/all_jobs_service.dart';


class AllJobsListForAdmin with ChangeNotifier {
  // ignore: non_constant_identifier_names
  Map<String, dynamic> JobsMap = {};
  Future<Map<String, dynamic>> fetchAllJobs() async {
    JobsMap = await FetchAllJobDetails().fetchAllJobsDetails();
   
    notifyListeners();

    
    return JobsMap;
  }
 
}
