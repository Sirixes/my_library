//https://www.googleapis.com/books/v1/volumes?q=search+terms
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



/** AL MOMENTO NON SERVE A UN CAZZO */




searchTry(String prova) async {
  String url = 'https://www.googleapis.com/books/v1/volumes?q=$prova+intitle';
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    //print(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
}
