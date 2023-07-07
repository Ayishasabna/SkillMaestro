import 'dart:developer';

import 'package:flutter/material.dart';

import '../../admin/controller/get_card_counts_service.dart';

class getCardProvider with ChangeNotifier {
  Map<String, dynamic> expert = {};
  Map<String, dynamic> cardcount = {};

  //getCardCounts
  Future<Map<String, dynamic>> cardCount() async {
    cardcount = await getCardCounts().getCardcounts();
    log("----------------card++++++ Count---------$cardcount");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return cardcount;
  }
}
