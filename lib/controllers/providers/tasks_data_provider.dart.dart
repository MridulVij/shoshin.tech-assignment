import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TasksDataProvider extends ChangeNotifier {
  List<dynamic> _tasksModelList = [];

  // Getter
  List<dynamic> get tasksModel => _tasksModelList;

  // Main Function
  Future<void> fetchTaskData() async {
    // 2 Seconds Delay for Testing Purpose Only
    await Future.delayed(Duration(seconds: 2));
    String dummyJson = await rootBundle.loadString('assets/dummy_tasks.json');
    _tasksModelList = json.decode(dummyJson);
    print('API Fetched for Json Tasks! ${_tasksModelList}');
    notifyListeners();
  }
}
