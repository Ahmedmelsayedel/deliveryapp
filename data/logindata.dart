import 'package:delivery/funcation/curd.dart';
import 'package:delivery/static/apilink.dart';

class Logindata {
  Curd curd;
  Logindata(this.curd);
  login(String email, String password) async {
    var response = await curd
        .postdata(Apilink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
