import 'package:delivery/controller/homescreencontroller.dart';
import 'package:delivery/controller/onthewaycontroller.dart';
import 'package:delivery/controller/pringdonecontroller.dart';
import 'package:delivery/controller/recievedonecontroller.dart';
import 'package:delivery/funcation/handlingdataview.dart';
import 'package:delivery/widget/custommaterial.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescreencontroller());
    Pringdonecontroller controller1 = Get.put(Pringdonecontroller());
    Recievedonecontroller controller2 = Get.put(Recievedonecontroller());
    Onthewaycontroller controller3 = Get.put(Onthewaycontroller());

    // TODO: implement build
    return GetBuilder<Homescreencontroller>(
        builder: (controller) => Handlingdataview(
            statesrequest: controller.statesrquest,
            widget: Scaffold(
              bottomNavigationBar: BottomAppBar(
                  child: Row(children: [
                ...List.generate(
                    controller.listpage.length,
                    (index) => Container(
                          padding: EdgeInsets.all(3),
                          child: Custommatrial(
                            onPressed: () {
                              controller.movepage(index);
                              controller1.getdata();
                              controller2.getdata();
                              controller3.getdata();
                            },
                            text: controller.pagename[index],
                            iconData: controller.icons[index],
                            active:
                                controller.currentpage == index ? true : false,
                          ),
                        ))
              ])),
              body: controller.listpage.elementAt(controller.currentpage),
            )));
  }
}
