//Class to take the data from the database and load it into the lists
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_library/from_firestore_to_lists/from_map_to_wouldread_list.dart';

import '../from_firestore_to_lists/from_map_to_read_list.dart';
import '../from_firestore_to_lists/from_map_to_reading_list.dart';
import '../global_variables.dart';
import 'book.dart';

class loadLists {
  loadLists() {
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> fireMap =
              documentSnapshot.data() as Map<String, dynamic>;
          fromMapToReadList(fireMap);
          fromMapToReadingList(fireMap);
          fromMapToWouldReadList(fireMap);
        }
      });
    }
  }
}
