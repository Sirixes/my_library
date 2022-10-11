//Class used to parse a map returned from firestore and add the book to the right list
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_library/global_variables.dart';
import 'package:my_library/providers/book.dart';

fromMapToWouldReadList(Map<String, dynamic> prova) {
  prova['wouldRead'].forEach((element) {
    wouldRead.add(Book(
        title: (element['title']) == null ? 'Not available' : element['title'],
        author: (element['authors']) == null
            ? 'not available'
            : ((element['authors'] as List).join(', ')),
        publisher: (element['publisher']) == null
            ? 'Publisher not avaiable'
            : element['publisher'],
        description: (element['description']) == null
            ? 'Not avaiable'
            : element['description'],
        thumbnailUrl: (element['thumbnailUrl']) == null
            ? 'Not avaiable'
            : element['thumbnailUrl']));
  });
}
