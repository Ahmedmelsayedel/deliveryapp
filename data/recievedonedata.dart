import 'package:delivery/funcation/curd.dart';
import 'package:delivery/static/apilink.dart';

class Recievedonedata {
  Curd curd;
  Recievedonedata(this.curd);
  pring(int id) async {
    var response = await curd.postdata(Apilink.receivedone, {"id":id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}