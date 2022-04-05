import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';
import 'package:my_library/providers/parse_book_func.dart';
import 'package:my_library/widgets/show_book_list.dart';

class FetchBook extends StatelessWidget {
  String url;
  String titleRow;
  FetchBook({Key? key, required this.url, required this.titleRow}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchBooks(url),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ShowBookList(snapshot.data!.cast<Book>(), titleRow);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

Future<List<Book>> _fetchBooks(String url) async {
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    //fino qua abbiamo il body che ci da la risposta giusta
    return parseBookJson(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
}
