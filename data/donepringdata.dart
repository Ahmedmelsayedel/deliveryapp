import 'package:delivery/funcation/curd.dart';
import 'package:delivery/static/apilink.dart';

class Donepringdata {
  Curd curd;
  Donepringdata(this.curd);
  pring() async {
    var response = await curd.postdata(Apilink.donepring, {});
    return response.fold((l) => l, (r) => r);
  }
}
