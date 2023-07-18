import 'package:flutter/material.dart';
import 'package:skillmaestro/user/model/review_model.dart';
import '../../user/controller/add_reveiw_service.dart';
import '../../user/controller/single_booking_service.dart';

class SingleBookingDetailsProvider with ChangeNotifier {
  Map<String, dynamic> singleBooking = {};
  double rating = 3;
  Future<void> getSingleBooking(bookingId, context) async {
    singleBooking =
        await ShowSingleBookingService().fetchBooking(bookingId, context);
    notifyListeners();
  }

  Future<void> postRating(ReviewModel reveiwData) async {
    AddReveiwService().addReveiw(reveiwData);
    notifyListeners();
  }

  set setRating(ratingValue) {
    rating = ratingValue;
    notifyListeners();
  }
}
