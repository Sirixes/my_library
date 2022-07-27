import 'package:flutter/material.dart';
import 'package:my_library/add_to_appropriate_list.dart';

import '../providers/book.dart';

class MyModalBottomSheet extends StatelessWidget {
  //Book passed to call the addToList function passing the right book
  Book book;
  MyModalBottomSheet(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text("Read"),
            onTap: () => addToList(book, "Read",
                context), //When you press it adds the book to the read list
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text("Reading"),
            onTap: () => addToList(book, "Reading", context),
          ),
          ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text("Would read"),
              onTap: () => addToList(book, "Would read", context))
        ],
      ),
    );
  }
}
