import 'package:flutter/material.dart';
import 'package:my_library/widgets/my_modal_bottom_sheet.dart';
import 'package:readmore/readmore.dart';
import '../providers/book.dart';

//Class used to build the details page of a book
class BookDetailsPage extends StatelessWidget {
  Book book;
  BookDetailsPage(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 350.0,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(book.thumbnailUrl),
                            fit: BoxFit.none))),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -10,
                  child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.white),
                      icon: const Icon(
                        Icons.add_outlined,
                        size: 30.0,
                      ),
                      label: const Text(
                        'Lists',
                      ),
                      //When you press it opens a Modal bottom sheet for adding a boom to one of my lists
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return MyModalBottomSheet(book);
                          }) //_onButtonPressed(),
                      ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text('Book Description'),
            ),
            SizedBox(
                height: 200.0,
                width: 300.0,
                child: Center(
                  child: ReadMoreText(
                    book.description,
                    trimLines: 4,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '.Show more',
                    trimExpandedText: ' show less',style: TextStyle(color: Colors.black,
                  ),
                )))
            //const Padding(
            //    padding: const EdgeInsets.all(16.0),
            //    child: ReadMoreText(
            //      'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
            //      trimLines: 2,
            //      colorClickableText: Colors.pink,
            //      trimMode: TrimMode.Line,
            //      trimCollapsedText: '...Read more',
            //      trimExpandedText: ' Less',
            //    ),)
          ],
        ),
      ),
    );
  }
}
