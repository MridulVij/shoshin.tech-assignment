import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/tasks_data_provider.dart.dart';
import 'package:shosin_tech_assignment/models/tasks_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_task_widgets.dart';
import 'details_dashboard.dart';

class TasksDashboardUI extends StatefulWidget {
  const TasksDashboardUI({super.key});

  @override
  State<TasksDashboardUI> createState() => _TasksDashboardUIState();
}

class _TasksDashboardUIState extends State<TasksDashboardUI> {
  @override
  void initState() {
    super.initState();
    Provider.of<TasksDataProvider>(context, listen: false).fetchTaskData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 29, 125, 205),
                  Color.fromARGB(255, 103, 144, 214)
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                stops: [0.0, 1.0],
              ),
            ),
          ),

          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Offers"),
                    Text("Gifts"),
                    Text("Upcoming"),
                    Text("My Offers"),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 217, 226, 228),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Trending offers"),
                  ),
                  CustomTask1Widget(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("More offers"),
                  ),
                  CustomTask2Widget(),
                ],
              ),
            ),
          ),
          // Top Custom App bar
          const CustomAppBar(),
        ],
      ),
    );
  }
}
