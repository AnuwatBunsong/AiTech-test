import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DeviceWidth {
  static Size size;
}

// ignore: non_constant_identifier_names
GetFileSize(String absolutePathImage) {
  return File(absolutePathImage).lengthSync();
}

// ignore: non_constant_identifier_names
GetFileName(String absolutePathImage) {
  File file = new File(absolutePathImage);
  return basename(file.path);
}