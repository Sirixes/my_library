import 'package:flutter/material.dart';
import 'package:my_library/providers/book.dart';

//Class used to show the home page book list

class ShowBookList extends StatelessWidget {
  //Ttitle upon the lit like 'continue to watch'
  String listTitle;
  List<Book> bookList;

  ShowBookList(this.bookList, this.listTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(listTitle,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                height: 220.0,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: bookList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Book book = bookList[index];
                      return InkWell(
                        onTap: () => print(book.title),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          height: 200.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(book.thumbnailUrl),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    })),
          ],
        ));
  }
}
