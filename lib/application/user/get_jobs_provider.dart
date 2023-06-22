import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';

class AlljobsListForUser with ChangeNotifier {
  Map<String, dynamic> userJobs = {};
  Future<Map<String, dynamic>> fetchAllJobsForUser() async {
    userJobs = await FetchJobs().fetch7Jobs();
    //log("----------------jobsMap---------$expert");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return userJobs;
  }
}
