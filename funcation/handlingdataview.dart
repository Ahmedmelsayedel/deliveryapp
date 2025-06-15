import 'package:delivery/funcation/statesrquest.dart';
import 'package:flutter/material.dart';

class Handlingdataview extends StatelessWidget {
  final Statesrquest statesrequest;
  final Widget widget;

  const Handlingdataview(
      {super.key, required this.statesrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statesrequest == Statesrquest.failure
        ? const Center(
            child: Text("failur"),
          )
        
            : statesrequest == Statesrquest.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : statesrequest == Statesrquest.offline
                    ? const Center(
                        child: Text("serveroffline"),
                      )
                    : widget;
  }
}
