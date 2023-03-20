import 'dart:developer';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:my_library/search/show_searched_grid.dart';
import 'package:my_library/widgets/show_book_list.dart';

import '../providers/book.dart';
import '../providers/parse_book_func.dart';

class FetchSearchedBook extends StatelessWidget {
  String query;
  FetchSearchedBook(this.query, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchBooks(query),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {              
              return ShowSearchedGrid(snapshot.data!.cast<Book>());
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

//Function for the http request
Future<List<Book>> _fetchBooks(String query) async {
  String url = 'https://www.googleapis.com/books/v1/volumes?q=$query';
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    //fino qua abbiamo il body che ci da la risposta giusta
    return parseBookJson(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
}
