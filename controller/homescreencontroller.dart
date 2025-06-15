
import 'package:delivery/funcation/statesrquest.dart';

import 'package:delivery/view/donepring.dart';
import 'package:delivery/view/ontheway.dart';
import 'package:delivery/view/receivedone.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Homescreencontroller extends GetxController {
 
  Statesrquest statesrquest = Statesrquest.none;
  int currentpage = 0;
  List listpage = [Donepring(), Ontheway(), Receivedone()];
  List<IconData> icons = [Icons.accessible, Icons.car_repair, Icons.done];
  List<String> pagename = ["Donepring", "Ontheway", "Receivedone"];
  movepage(int index) {
    currentpage = index;
    update();
  }





}
