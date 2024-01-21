import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/models/details_model.dart';

import '../widgets/custom_container.dart';

class DetailsDashboardUI extends StatefulWidget {
  final int index;
  const DetailsDashboardUI({super.key, required this.index});

  @override
  State<DetailsDashboardUI> createState() => _DetailsDashboardUIState();
}

class _DetailsDashboardUIState extends State<DetailsDashboardUI> {
  @override
  void dispose() {
    super.dispose();
    DetailsDataProvider().detailsModelList.clear();
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
            child: Container(),
          ),
        ),
        //
        Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [],
                ),
                Divider(),
                Text('Steps (1/4)'),
                //
                CustomContainer(
                  borderColor: Colors.green,
                  buttonColor: Colors.green,
                  buttontextColor: Colors.white,
                  containerColor: Colors.white,
                  title: "Install the application",
                  containerEnable: true,
                  description: "",
                  icon: Icons.done,
                  iconEnable: true,
                ),
                CustomContainer(
                  borderColor: Colors.yellow[700]!,
                  buttonColor: Colors.yellow[700]!,
                  buttontextColor: Colors.white,
                  containerColor: Colors.white,
                  title: "Install the application",
                  containerEnable: true,
                  description: "",
                  icon: Icons.hourglass_empty,
                  iconEnable: true,
                )
              ],
            )),
        CustomBackButtonAppBar(context),
      ],
    )

        //  Consumer<DetailsDataProvider>(builder: (context, state, child) {
        //   if (state.detailsModelList.isNotEmpty) {
        //     final detailData = DetailsModel.fromJson(state.detailsModel);
        //     return Container(
        //       child: Text(detailData.description!),
        //     );
        //   } else {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }
        // }),
        );
  }

// Custom Widget
  Widget CustomBackButtonAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                )),
            Text(
              "Offer detail",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
