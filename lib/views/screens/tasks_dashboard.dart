import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/tasks_data_provider.dart.dart';
import 'package:shosin_tech_assignment/models/tasks_model.dart';

import 'details_dashboard.dart';

class TasksDashboardUI extends StatefulWidget {
  const TasksDashboardUI({super.key});

  @override
  State<TasksDashboardUI> createState() => _TasksDashboardUIState();
}

class _TasksDashboardUIState extends State<TasksDashboardUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TasksDataProvider>(context, listen: false).fetchTaskData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<TasksDataProvider>(
      builder: (context, state, child) {
        if (state.tasksModel.isNotEmpty) {
          return ListView.builder(
            itemCount: state.tasksModel.length,
            itemBuilder: (context, index) {
              final tasksModel = TasksModel.fromJson(state.tasksModel[index]);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<DetailsDataProvider>(context, listen: false)
                        .fetchDetailsData(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsDashboardUI(
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: double.maxFinite,
                    color: Colors.red,
                    child: Text(tasksModel.title!),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
