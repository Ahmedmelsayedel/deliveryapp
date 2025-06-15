import 'package:delivery/funcation/statesrquest.dart';

handlingdata(response) {
  if (response is Statesrquest) {
    return response;
  } else {
    return Statesrquest.success;
  }
}
