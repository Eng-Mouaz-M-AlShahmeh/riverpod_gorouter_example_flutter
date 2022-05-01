// Developed by Eng Mouaz M AlShahmeh
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:riverpod_flutter/src/domain/photo.dart';
import 'package:http/http.dart' as http;

List<Photo> parsePhotos(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

Future<List<Photo>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Can\'t get photos');
  }
}
