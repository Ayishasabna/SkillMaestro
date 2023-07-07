import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/controller/chart_service.dart';

import '../../admin/controller/get_card_counts_service.dart';

class ChartDataProvider with ChangeNotifier {
  Map<String, dynamic> expert = {};
  Map<String, dynamic> cardcount = {};
  Future<Map<String, dynamic>> chartData() async {
    expert = await ChartDataService().getChartData();
    log("----------------chartprovider---------$expert");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return expert;
  }

  //getCardCounts
  Future<Map<String, dynamic>> cardCount() async {
    cardcount = await getCardCounts().getCardcounts();
    log("----------------card Count---------$cardcount");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return cardcount;
  }
}
