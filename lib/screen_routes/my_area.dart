import 'package:flutter/material.dart';
import 'package:my_library/global_variables.dart';
import 'package:my_library/providers/fetch_book.dart';
import 'package:my_library/widgets/show_book_list.dart';

//Class that calls the show_book_list widget to show my book list passing
//the list of books in the global variables and the title of the list

class MyArea extends StatelessWidget {
  const MyArea({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ShowBookList(reading, 'Reading')
          ),
          SliverToBoxAdapter(
            child: ShowBookList(wouldRead, 'Would read')
          ),
          SliverToBoxAdapter(
            child: ShowBookList(read, 'Read')

          )
        ],
      ),
    );
  }
}