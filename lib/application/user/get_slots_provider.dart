
import 'package:flutter/material.dart';
import '../../user/controller/fetch_jobs_service.dart';

class GetSlotsForUserProvider with ChangeNotifier {
  Map<String, dynamic> userSlots = {};

  Future<Map<String, dynamic>> getSlotesForUser(String id) async {
    userSlots = await FetchJobs().getSlots(id);

    notifyListeners();

    return userSlots;
  }
}
