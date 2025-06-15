import 'package:delivery/controller/onthewaycontroller.dart';
import 'package:delivery/controller/recievedonecontroller.dart';
import 'package:delivery/funcation/handlingdataview.dart';
import 'package:delivery/model/ordermodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Ontheway extends StatelessWidget {
  const Ontheway({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onthewaycontroller());

    // TODO: implement build
    return GetBuilder<Onthewaycontroller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrquest,
            widget: Scaffold(
                body: Container(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.data2.length,
                itemBuilder: (context, index) {
                  return Details(controller.data2[index]);
                },
              ),
            ))));
  }
}

class Details extends GetView<Onthewaycontroller> {
  final OrderModel orederModel;
  const Details(this.orederModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text("${Jiffy.parse('${orederModel.orderData}').fromNow()}"),
        Row(children: [
          Text("your order is number:${orederModel.ordreId}",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
        Text(
          "way to payment :${orederModel.paymentmethod}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "delevery price :${orederModel.orderDeleveryprice}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Row(
          children: [
            Text(
              "total price :${orederModel.orderTotal}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {
                controller.updatastat(orederModel.ordreId!);
              },
              child: Text("Recieve Order"),
              color: Colors.blue,
            )
          ],
        ),
      ],
    );
  }
}
