import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/expert_profile_service.dart';
import 'package:skillmaestro/expert/model/expert_profile_model.dart';

import '../../expert/model/expert_edit_profile_model.dart';

class ExpertProfileProvider with ChangeNotifier {
  Future<ExpertProfileModel?>? expertDetails;

  Future<void> getExpertDetails() async {
    expertDetails = ExpertProfileService().ExpertProfile();
    notifyListeners();
  }

  Future<void> editexpertProfile(EditExpertProfileModel editData) async {
    ExpertProfileService().editExpertProfile(editData);
    notifyListeners();
  }
}
