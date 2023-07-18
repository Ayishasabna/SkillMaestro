import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/job_detail_service.dart';
import 'package:skillmaestro/expert/model/send_estimate_model.dart';
import 'package:skillmaestro/user/model/cancel_booking_model.dart';
import 'package:skillmaestro/user/view/user_booking_description.dart';

import '../../user/controller/booking_details_service.dart';
import '../../user/model/decline_estimation_model.dart';

class JobDetailProvider with ChangeNotifier {
  //Future<ExpertProfileModel?>? expertDetails;

  Future<void> approveEstimate(String id) async {
    await UserBookingDetailsService().approveEstimate(id);
    // expertDetails = ExpertProfileService().ExpertProfile();
    notifyListeners();
  }

  Future<void> declineEstimate(DeclineEstimationModel model) async {
    await UserBookingDetailsService().declineEstimate(model);
    // expertDetails = ExpertProfileService().ExpertProfile();
    notifyListeners();
  }

  Future<void> cancelBooking(CancelBookingModel CancelModel) async {
    await UserBookingDetailsService().cancelBooking(CancelModel);
    // expertDetails = ExpertProfileService().ExpertProfile();
    notifyListeners();
  }

  // Future<void> editexpertProfile(EditExpertProfileModel editData) async {
  //   ExpertProfileService().editExpertProfile(editData);
  //   notifyListeners();
  // }
}
