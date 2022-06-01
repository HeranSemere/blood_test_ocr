import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

UploadImage(File img) async {

var uri = Uri.parse("https://api.mindee.net/v1/products/Heran/blood_test_ocr/v1/predict");
Map<String, String> headers = { "Authorization": "Token 253fa465a441ab42afd6efbb5a864203"};

 var request = new http.MultipartRequest("POST", uri);
 request.headers.addAll(headers);
 request.files.add( new http.MultipartFile.fromBytes("document", img.readAsBytesSync(), filename: "image")); //file

  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}