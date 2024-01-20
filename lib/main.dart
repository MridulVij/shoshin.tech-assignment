import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/tasks_data_provider.dart.dart';
import 'package:shosin_tech_assignment/views/screens/tasks_dashboard.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DetailsDataProvider()),
          ChangeNotifierProvider(create: (context) => TasksDataProvider()),
        ],
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: TasksDashboardUI(),
            ),
          );
        });
  }
}
