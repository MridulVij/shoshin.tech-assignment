import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsDataProvider extends ChangeNotifier {
  List<dynamic> detailsModelList = [];
  dynamic _indexSpecificDetailsData;

  // Getter
  dynamic get detailsModel => _indexSpecificDetailsData;

  // Main Function
  Future<void> fetchDetailsData(int index) async {
    // 2 Seconds Delay for Testing Purpose Only
    // await Future.delayed(Duration(seconds: 2));
    String dummyJson = await rootBundle.loadString('assets/dummy_details.json');
    detailsModelList = json.decode(dummyJson);
    _indexSpecificDetailsData = detailsModelList[index];
    print('API Fetched for Json Details! ${_indexSpecificDetailsData}');
    notifyListeners();
  }
}
