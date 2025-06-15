import 'package:delivery/data/onthewaydata.dart';
import 'package:delivery/data/updatedata.dart';
import 'package:delivery/funcation/handlingdata.dart';
import 'package:delivery/funcation/myservices.dart';
import 'package:delivery/funcation/statesrquest.dart';
import 'package:delivery/model/ordermodel.dart';

import 'package:get/get.dart';

class Onthewaycontroller extends GetxController {
  List<OrderModel> data2 = [];
  Statesrquest statesrquest = Statesrquest.none;
  Onthewaydata onthewaydata = Onthewaydata(Get.find());
  Updatedata updatedata = Updatedata(Get.find());
  Myservices myservices = Get.find();
  getdata() async {
    data2.clear();
    statesrquest = Statesrquest.loading;
    update();
    var response =
        await onthewaydata.pring(myservices.sharedPreferences.getInt("id")!);
    statesrquest = handlingdata(response);
    if (statesrquest == Statesrquest.success) {
      if (response["status"] == "success") {
        List responselist = response["data"];
        data2.addAll(responselist.map((e) => OrderModel.fromJson(e)));

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

  updatastat(int id) async {
    statesrquest = Statesrquest.loading;
    update();
    var response = await updatedata.updata(id);
    statesrquest = handlingdata(response);
    if (statesrquest == Statesrquest.success) {
      if (response["status"] == "success") {
        getdata();
      } else {
        print("failure");
      }
    } else {
      statesrquest = Statesrquest.failure;
    }
    update();
  }
   
}
