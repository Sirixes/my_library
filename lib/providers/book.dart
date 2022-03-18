import 'package:flutter/material.dart';

class Book {

  final List kind;

  Book({required this.kind});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      kind: json['items'],
    );
  }
}
