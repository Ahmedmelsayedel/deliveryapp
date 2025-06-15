import 'dart:convert';
import 'dart:io';

import 'package:delivery/funcation/checkinternet.dart';
import 'package:delivery/funcation/statesrquest.dart';
import 'package:either_dart/either.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

String _basicAuth = "Basic${base64Decode(utf8.encode("admin:admin") as String)}";

Map<String, String> _myheaders = {
  // "Content-type":"application/json",
  //"Accept":"application/json",
   'authorization':_basicAuth
};

class Curd {
  Future<Either<Statesrquest, Map>> postdata(String linkapi, Map data) async {
    if (await Checkinternet()) {
      var response = await http.post(Uri.parse(linkapi), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return const Left(Statesrquest.failure);
      }
    } else {
      return const Left(Statesrquest.offline);
    }
  }

  Future<Either<Statesrquest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(Statesrquest.offline);
    }
  }
}
