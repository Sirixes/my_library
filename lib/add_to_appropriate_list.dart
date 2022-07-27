import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';

import 'global_variables.dart';

//Class used to add the book to selected list in the book details page and
//return the widget to show the snack bar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> addToList(
    Book book, String list, BuildContext context) {
  final snackBar = SnackBar(
    content:
        Text('Book added to ' + list + ' list', textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
  );

  if (list == "Read") {
    read.add(book);
  } else if (list == "Reading") {
    reading.add(book);
  } else if (list == "Would read") {
    wouldRead.add(book);
  }
  Navigator.pop(context);

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
