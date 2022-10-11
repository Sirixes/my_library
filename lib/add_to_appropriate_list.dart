import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'read': read.map((e) => e.toJson()).toList(),
      });
    }
  } else if (list == "Reading") {
    reading.add(book);
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'reading': reading.map((e) => e.toJson()).toList(),
      });
    }
  } else if (list == "Would read") {
    wouldRead.add(book);
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'wouldRead': wouldRead.map((e) => e.toJson()).toList(),
      });
    }
  }
  Navigator.pop(context);

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
