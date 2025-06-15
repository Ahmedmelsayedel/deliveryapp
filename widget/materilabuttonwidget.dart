import 'package:flutter/material.dart';


class Materialbuttoninlogin extends StatelessWidget {
  final String button;
  final void Function()? onPressed;
  const Materialbuttoninlogin(
      {super.key, required this.button, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blue,
      height: 50,
      textColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock),
          Text(
            button,
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
