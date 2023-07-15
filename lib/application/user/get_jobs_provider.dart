import 'package:flutter/material.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';

import '../../user/controller/user_bookings_service.dart';

class AlljobsListForUser with ChangeNotifier {
  Map<String, dynamic> userJobs = {};
  Map<String, dynamic> userBooking = {};
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

  Future<Map<String, dynamic>> GetUserBookings() async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    userBooking = await UserBookings().getAllUserBookings();
    //log('=================providerbooking======$booking=================');

    notifyListeners();
    return userBooking;
  }

  /* Future<Map<String, dynamic>> getSlotesForUser() async {
    userJobs = await FetchJobs().getSlots();
    //log("----------------jobsMap---------$expert");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return userJobs;
  } */
}
