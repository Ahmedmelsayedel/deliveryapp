import 'package:delivery/data/logindata.dart';
import 'package:delivery/funcation/curd.dart';
import 'package:delivery/funcation/handlingdata.dart';
import 'package:delivery/funcation/myservices.dart';
import 'package:delivery/funcation/statesrquest.dart';
import 'package:delivery/static/pagename.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  Statesrquest statesrquest = Statesrquest.none;
  Logindata logindata = Logindata(Get.put(Curd()));
  Myservices myservices = Get.put(Myservices());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool ishide = false;
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  changehidepasspowrd() {
    if (ishide == false) {
      ishide = true;
      update();
    } else {
      ishide = false;
      update();
    }
  }

  logincheck() async {
    if (formstate.currentState!.validate()) {
      statesrquest = Statesrquest.loading;
      var response = await logindata.login(email.text, password.text);
      statesrquest = handlingdata(response);
      if (statesrquest == Statesrquest.success) {
        if (response["status"] == "success") {
          myservices.sharedPreferences
              .setInt("id", response["data"]["user_id"]);
          myservices.sharedPreferences.setString("1", "home");
          Get.offAllNamed(Pagename.homepage);
        } else {
          Get.snackbar("warning", "your email or password is wrong");
        }
      } else {
        statesrquest = Statesrquest.failure;
      }
    } else {
      print("notvaild");
    }
  }
}
