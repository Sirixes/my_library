import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';
import 'package:my_library/providers/parse_book_func.dart';

const url =
    'https://www.googleapis.com/books/v1/volumes?q=harry+potter+inauthor:rowling';

class MyBook1 extends StatelessWidget {
  const MyBook1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _fetchPotterBooks(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            //print(snapshot.data.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView(
                    children: snapshot.data!.map((b) => BookTile(b)).toList());
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Future<List<Book>> _fetchPotterBooks() async {
  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    //fino qua abbiamo il body che ci da la risposta giusta
    return parseBookJson(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
}

class BookTile extends StatelessWidget {
  final Book book;
  BookTile(this.book);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: book.thumbnailUrl == 'Not avaiable'
            ? (const NetworkImage(
                'https://whetstonefire.org/wp-content/uploads/2020/06/image-not-available.jpg'))
            : NetworkImage(book.thumbnailUrl),
      ),
      title: Text(book.title),
      subtitle: Text(book.author),
      //onTap: () => _navigateToDetailsPage(book, context),
    );
  }
}


