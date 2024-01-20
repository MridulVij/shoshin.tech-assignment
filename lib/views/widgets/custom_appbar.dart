import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Hey, Shanmukha!",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                      ),
                      Text(
                        "\u20b9 452",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
