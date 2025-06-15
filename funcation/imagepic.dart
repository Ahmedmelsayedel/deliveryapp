import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'package:image_picker/image_picker.dart';

fileUploadImage([issvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: issvg ? ["svg,SVG"] : ["png,PNG,JPG,jpg,gif,GIF"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

imageUploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 80);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}
