import 'package:flutter/material.dart';
import 'package:skillmaestro/user/model/cancel_booking_model.dart';
import '../../user/controller/booking_details_service.dart';
import '../../user/model/decline_estimation_model.dart';

class JobDetailProvider with ChangeNotifier {
  

  Future<void> approveEstimate(String id) async {
    await UserBookingDetailsService().approveEstimate(id);
   
    notifyListeners();
  }

  Future<void> declineEstimate(DeclineEstimationModel model) async {
    await UserBookingDetailsService().declineEstimate(model);
    
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<void> cancelBooking(CancelBookingModel CancelModel) async {
    await UserBookingDetailsService().cancelBooking(CancelModel);
    
    notifyListeners();
  }

  
}
