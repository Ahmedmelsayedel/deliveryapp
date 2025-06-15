import 'package:get/get.dart';

valdate(String type, int min, int max, String val) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not email";
    }
    if (val.isEmpty) {
      return "not empty";
    }
    if (val.length > max) {
      return "must be less than $max";
    }
  }
  if (val.length < min) {
    return "must be more than $min";
  }
}
