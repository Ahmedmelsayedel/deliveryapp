import 'package:flutter/material.dart';

class Custommatrial extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  final bool? active;
  const Custommatrial({
    super.key,
  required  this.onPressed,
    required this.text,
    required this.iconData,  this.active,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      minWidth: 2,
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? Colors.blue : Colors.black,
          ),
          Text(
            (text),
            style: TextStyle(
              color: active == true ? Colors.blue : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}