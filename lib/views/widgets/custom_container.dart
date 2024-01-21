import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color borderColor;
  final Color buttonColor;
  final Color buttontextColor;
  final IconData icon;
  final String title;
  final String description;
  final Color containerColor;
  final bool containerEnable;
  final bool iconEnable;
  const CustomContainer(
      {super.key,
      required this.borderColor,
      required this.buttonColor,
      required this.buttontextColor,
      required this.icon,
      required this.title,
      required this.description,
      required this.containerColor,
      required this.containerEnable,
      required this.iconEnable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2, color: borderColor)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: buttonColor,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  Text('  ${title}'),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  // height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: buttonColor,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Center(
                      child: Text(
                        "20",
                        style: TextStyle(color: buttontextColor),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        (description == "") ? Container() : Text(description),
      ]),
    );
  }
}
