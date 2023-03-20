import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_library/providers/fetch_book.dart';
import 'package:my_library/widgets/custom_app_bar.dart';
import 'package:my_library/widgets/snack_bar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Probabilmente è inutile fare stafeul il widget però bona
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //With MediaQuery we take the size of the device and it adapts to
    //all screens
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FetchBook(
                url:
                    'https://www.googleapis.com/books/v1/volumes?q=Harry+Potter',
                titleRow: 'titleRow'),
          ),
          SliverToBoxAdapter(
            child: FetchBook(
                url:
                    'https://www.googleapis.com/books/v1/volumes?q=ciao',
                titleRow: 'titleRow1'),
          ),
        ],
      ),
    );
  }
}
