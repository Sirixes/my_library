import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';

class MyBook extends StatefulWidget {
  const MyBook({Key? key}) : super(key: key);

  @override
  _MyBookState createState() => _MyBookState();
}

//Future is essential for async call
Future<Book> fetchBook() async {
  final response = await http.get(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=harry+potter+inauthor:rowling'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Book.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load books list');
  }
}

class _MyBookState extends State<MyBook> {
  late Future<Book> futureBook;
  @override
  void initState() {
    super.initState();
    futureBook = fetchBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<Book>(
        future: futureBook,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //Per stampare la parte giusta guardare qua https://stackoverflow.com/questions/52432443/flutter-parsing-google-books-api
            return Text(snapshot.data!.kind.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    ));
  }
}
