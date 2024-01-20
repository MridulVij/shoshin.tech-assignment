// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../controllers/providers/details_data_provider.dart';
// import '../../controllers/providers/tasks_data_provider.dart.dart';
// import '../../models/tasks_model.dart';
// import '../screens/details_dashboard.dart';

// class CustomTaskWidget extends StatelessWidget {
//   const CustomTaskWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TasksDataProvider>(
//       builder: (context, state, child) {
//         if (state.tasksModel.isNotEmpty) {
//           return Expanded(
//             flex: 1,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: state.tasksModel.length,
//               itemBuilder: (context, index) {
//                 final tasksModel = TasksModel.fromJson(state.tasksModel[index]);
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Provider.of<DetailsDataProvider>(context, listen: false)
//                           .fetchDetailsData(index);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailsDashboardUI(
//                             index: index,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 10,
//                       width: 150,
//                       color: Colors.red,
//                       child: Text(tasksModel.title!),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
