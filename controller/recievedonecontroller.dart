import 'package:delivery/data/recievedonedata.dart';

import 'package:delivery/funcation/curd.dart';
import 'package:delivery/funcation/handlingdata.dart';
import 'package:delivery/funcation/myservices.dart';
import 'package:delivery/funcation/statesrquest.dart';
import 'package:delivery/model/ordermodel.dart';
import 'package:get/get.dart';

class Recievedonecontroller extends GetxController {
  List<OrderModel> data3 = [];
  Statesrquest statesrquest = Statesrquest.none;
  Recievedonedata recievedonedata = Recievedonedata(Get.put(Curd()));

  Myservices myservices = Get.find();
  getdata() async {
    data3.clear();
    statesrquest = Statesrquest.loading;
    update();
    var response =
        await recievedonedata.pring(myservices.sharedPreferences.getInt("id")!);
    statesrquest = handlingdata(response);
    if (statesrquest == Statesrquest.success) {
      if (response["status"] == "success") {
        List responselist = response["data"];
        data3.addAll(responselist.map((e) => OrderModel.fromJson(e)));

        print(responselist);
      } else {
        print("done pring failur");
      }
    } else {
      statesrquest = Statesrquest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }


}
