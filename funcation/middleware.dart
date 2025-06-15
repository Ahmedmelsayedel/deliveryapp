import 'package:delivery/funcation/myservices.dart';
import 'package:delivery/static/pagename.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Middleware extends GetMiddleware {
  Myservices myservices = Get.put(Myservices());
  @override
  // TODO: implement priority
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("1") == "home") {
      return const RouteSettings(name: Pagename.homepage);
    }
  }
}
