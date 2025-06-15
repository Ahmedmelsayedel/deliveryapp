import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titlelogin extends StatelessWidget {
  final String title;
  final String title2;
  const Titlelogin({super.key, required this.title, required this.title2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 3, 7, 231),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(title2,
            style: const TextStyle(
                color: Color.fromARGB(
                  255,
                  16,
                  192,
                  245,
                ),
                fontSize: 30,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
