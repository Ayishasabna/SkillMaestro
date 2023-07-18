import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import '../../user/controller/user_bookings_service.dart';

class AlljobsListForUser with ChangeNotifier {
  Map<String, dynamic> userJobs = {};
  Map<String, dynamic> jobDetail = {};
  Map<String, dynamic> userBooking = {};
  Future<Map<String, dynamic>> fetchAllJobsForUser() async {
    userJobs = await FetchJobs().fetch7Jobs();
    
    notifyListeners();

    return userJobs;
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> fetchJobDetail(String job_role) async {
    jobDetail = await FetchJobs().getJobDetail(job_role);
    
    notifyListeners();

    return jobDetail;
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> GetUserBookings() async {
    
    userBooking = await UserBookings().getAllUserBookings();
   

    notifyListeners();
    return userBooking;
  }

}
