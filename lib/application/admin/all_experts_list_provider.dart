import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/all_experts_service.dart';

class AllExpertListForAdmin with ChangeNotifier {
  Map<String, dynamic> expert = {};
  Future<Map<String, dynamic>> fetchAllExperts() async {
    expert = await FetchAllExpertsDetails().fetchAllExpertsDetails();
    log("----------------jobsMap---------$expert");
    notifyListeners();

    return expert;
  }
}
