import 'package:delivery/funcation/curd.dart';
import 'package:delivery/static/apilink.dart';

class Updatedata {
  Curd curd;
  Updatedata(this.curd);
  updata(int id) async {
    var response = await curd.postdata(Apilink.updatestat, {"orderid": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
