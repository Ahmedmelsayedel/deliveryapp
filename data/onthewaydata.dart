import 'package:delivery/funcation/curd.dart';
import 'package:delivery/static/apilink.dart';

class Onthewaydata {
  Curd curd;
  Onthewaydata(this.curd);
  pring(int id) async {
    var response = await curd.postdata(Apilink.ontheway, {
      "id":id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}