//Class used to parse a map returned from firestore and add the book to the right list
//Le tre classi tutte uguali si possono comprimere in una mettenedo nel for each anche il
//value e cofrontando il value se è author o publisher etc...
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_library/global_variables.dart';
import 'package:my_library/providers/book.dart';

fromMapToReadList(Map<String, dynamic> prova) {
  prova['read'].forEach((element) {
    read.add(Book(
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
