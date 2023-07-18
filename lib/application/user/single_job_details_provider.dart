import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/user/model/review_model.dart';

import '../../user/controller/add_reveiw_service.dart';
import '../../user/controller/single_booking_service.dart';
import '../../user/model/single_booking_details_response_model.dart';
//import '../../user/model/single_booking_details_model.dart';

class SingleBookingDetailsProvider with ChangeNotifier {
  //Future<ShowSingleBookingDetailsModel?>? singleBooking;
  Map<String, dynamic> singleBooking = {};
  double rating = 3;
  Future<void> getSingleBooking(bookingId, context) async {
    singleBooking =
        await ShowSingleBookingService().fetchBooking(bookingId, context);
    notifyListeners();
    //return singleBooking;
  }

  Future<void> postRating(ReviewModel reveiwData) async {
    AddReveiwService().addReveiw(reveiwData);
  }

  set setRating(ratingValue) {
    rating = ratingValue;
    notifyListeners();
  }
}
