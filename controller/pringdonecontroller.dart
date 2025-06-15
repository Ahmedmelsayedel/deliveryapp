import 'package:delivery/data/donepringdata.dart';
import 'package:delivery/data/updatedata.dart';
import 'package:delivery/funcation/curd.dart';
import 'package:delivery/funcation/handlingdata.dart';
import 'package:delivery/funcation/statesrquest.dart';
import 'package:delivery/model/ordermodel.dart';
import 'package:get/get.dart';

class Pringdonecontroller extends GetxController {
  List<OrderModel> data = [];
  Statesrquest statesrquest = Statesrquest.none;
  Donepringdata donepringdata = Donepringdata(Get.put(Curd()));

  Updatedata updatedata = Updatedata(Get.find());
  getdata() async {
    data.clear();
    statesrquest = Statesrquest.loading;
    update();
    var response = await donepringdata.pring();
    statesrquest = handlingdata(response);
    if (statesrquest == Statesrquest.success) {
      if (response["status"] == "success") {
        List responselist = response["data"];
        data.addAll(responselist.map((e) => OrderModel.fromJson(e)));

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
