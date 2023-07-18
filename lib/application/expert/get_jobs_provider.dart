import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/expert_add_job_service.dart';
import 'package:skillmaestro/expert/controller/expert_add_shedule_service.dart';
import 'package:skillmaestro/expert/controller/expert_get_all_jobs_service.dart';
import 'package:skillmaestro/expert/controller/my_bookings_service.dart';

class ExpertAllJobsProvider with ChangeNotifier {
  Map<String, dynamic> expertJobs = {};
  Map<String, dynamic> expertSelectedJobs = {};
  Map<String, dynamic> booking = {};

  Map<String, dynamic> response = {};
  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> AllJobsForExpert() async {
    expertJobs = await AllJobService().getAllJobs();
    
    notifyListeners();

    return expertJobs;
  }

  Future<Map<String, dynamic>> selectedJobsByExpert() async {
    expertSelectedJobs = await AllJobService().getJobsByExpert();

    notifyListeners();

    return expertSelectedJobs;
  }

  // ignore: non_constant_identifier_names
  Future<void> AddExpertSkill(Set<String> skills) async {
    await ExpertAddJobService().ExpertAddSkill(skills);

    notifyListeners();
  }

  Future<void> removeExpertSkill(String id) async {
    await ExpertAddJobService().removeExpertSkill(id);

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<void> AddExpertShedule(
      List<DateTime> dates, BuildContext context) async {
    await ExpertAddShedule().AddShedule(dates, context);

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> GetExpertShedule() async {
    Map<String, dynamic> response = await ExpertAddShedule().GetShedule();

    notifyListeners();
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> GetMyBookings() async {
    booking = await MyBookings().getAllBookings();

    notifyListeners();
    return booking;
  }
}
