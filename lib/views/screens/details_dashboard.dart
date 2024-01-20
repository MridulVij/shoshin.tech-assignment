import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/models/details_model.dart';

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
      body: Consumer<DetailsDataProvider>(builder: (context, state, child) {
        if (state.detailsModelList.isNotEmpty) {
          final detailData = DetailsModel.fromJson(state.detailsModel);
          return Container(
            child: Text(detailData.description!),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
