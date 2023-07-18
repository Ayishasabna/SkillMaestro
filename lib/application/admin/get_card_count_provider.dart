import 'package:flutter/material.dart';
import '../../admin/controller/get_card_counts_service.dart';

// ignore: camel_case_types
class getCardProvider with ChangeNotifier {
  Map<String, dynamic> expert = {};
  Map<String, dynamic> cardcount = {};

  //getCardCounts
  Future<Map<String, dynamic>> cardCount() async {
    cardcount = await getCardCounts().getCardcounts();

    notifyListeners();

    return cardcount;
  }
}
