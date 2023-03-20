import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';

import '../global_variables.dart';
import '../screen_routes/book_details_page.dart';

//Class that contains widget used to show the home page book list

class ShowSearchedGrid extends StatelessWidget {
  //Ttitle upon the lit like 'continue to watch'
  //List of books to show
  List<Book> bookList;

  ShowSearchedGrid(this.bookList, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Container(
          //height: 220.0,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
                  padding: const EdgeInsets.only(top: 48.0),
              itemCount: bookList.length,
              itemBuilder: (BuildContext context, int index) {
                final Book book = bookList[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDetailsPage(book))),
                  child: Container(
                    //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 200.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(book.thumbnailUrl),
                            fit: BoxFit.cover)),
                  ),
                );
              })),
    );
  }
}
