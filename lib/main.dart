import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_library/screen_routes/home_screen.dart';
import 'package:my_library/screen_routes/nav_screen.dart';

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
  final screen = [const HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavScreen(),
    );
  }
}
