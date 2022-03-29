import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_library/providers/fetch_book.dart';
import 'package:my_library/screen_routes/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final screen = [
    //const Home(),
    const FetchBook()

  ];

  //Function for tap on bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: Scaffold(
            body:
            
                Stack(children: <Widget>[ 
                  Container(child: screen[selectedIndex]),
                  ]),
            //Bottom navigation configuration
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'Area Personale')
              ],
              currentIndex: selectedIndex,
              backgroundColor: Colors.grey[100],
              onTap: _onItemTapped,
            )));
  }
}
