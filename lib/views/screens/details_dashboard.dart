import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shosin_tech_assignment/controllers/providers/details_data_provider.dart';
import 'package:shosin_tech_assignment/models/details_model.dart';
import '../widgets/custom_container.dart';

class DetailsDashboardUI extends StatefulWidget {
  final int index;
  final String logo;
  final String users;
  const DetailsDashboardUI(
      {super.key,
      required this.index,
      required this.logo,
      required this.users});

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
      body: Consumer<DetailsDataProvider>(
        builder: (context, state, child) {
          if (state.detailsModelList.isNotEmpty) {
            final detailData = DetailsModel.fromJson(state.detailsModel);
            return Stack(
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
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.users} users has already participated!',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: 50,
                        // width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Center(
                            child: Text(
                          'Get ${detailData.payout}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.logo,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Gap(5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailData.title!,
                                ),
                                const Gap(15),
                                Text(
                                  "focus on your project will take care of routine",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 10),
                                ),
                                const Gap(15),
                                RatingBar.builder(
                                  itemSize: 20,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                        const Gap(10),
                        const Divider(),
                        const Text('Steps (1/4)'),
                        //
                        const Gap(10),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              CustomContainer(
                                buttonAmountText: detailData.payout!,
                                borderColor: Colors.green,
                                buttonColor: Colors.green,
                                buttontextColor: Colors.white,
                                containerColor: Colors.white,
                                title: "Install The Application",
                                containerEnable: true,
                                description: "",
                                icon: Icons.done,
                                iconEnable: true,
                              ),
                              const Gap(10),
                              CustomContainer(
                                buttonAmountText: detailData.payout!,
                                borderColor: Colors.yellow[700]!,
                                buttonColor: Colors.yellow[700]!,
                                buttontextColor: Colors.white,
                                containerColor: Colors.white,
                                title: "Complete 3 offers",
                                containerEnable: true,
                                description: detailData.description!,
                                icon: Icons.hourglass_empty,
                                iconEnable: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomBackButtonAppBar(context),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

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
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                )),
            const Text(
              "Offer detail",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
