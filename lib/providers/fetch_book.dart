import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';
import 'package:my_library/providers/parse_book_func.dart';
import 'package:my_library/show_book_list.dart';

const url = 'https://www.googleapis.com/books/v1/volumes?q=Harry+Potter+intitle';
//'https://www.googleapis.com/books/v1/volumes?q=harry+potter+inauthor:rowling';

class FetchBook extends StatelessWidget {
  const FetchBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: FutureBuilder(
          future: _fetchBooks(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                //print(snapshot.data!.cast<Book>());
                //return ListView(
                //children: snapshot.data!.map((b) => BookTile(b)).toList());
                return ShowBookList(snapshot.data!.cast<Book>(), 'My List');
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Future<List<Book>> _fetchBooks() async {
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
