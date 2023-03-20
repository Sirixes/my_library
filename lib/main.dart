import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_library/authentication/auth_screen.dart';
import 'package:my_library/global_variables.dart';
import 'package:my_library/providers/load_my_data.dart';
import 'package:my_library/providers/search_engine.dart';
import 'package:my_library/screen_routes/home_screen.dart';
import 'package:my_library/widgets/nav_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(inizialization);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future inizialization(BuildContext? context) async {
  /**Legare Splash screen in modo che venga mostrato quando è finito il 
   * caricamento della schermata principale */
  //searchTry();
  loadLists();
  //Per il momento dura 2 secondi e poi scompare
  await Future.delayed(const Duration(seconds: 2));
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
    return MaterialApp(
      //Quando trova un token nella cache oppure viene fatto login o registrazione
      //accede alla pagina principale se invece il token scade fa logout, se userSnapshot ha dati vuol dire che c'è un
      //token valido
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              /* TODO
                Fare parte logout
                
              */
              print(name);
              return NavScreen();
            }
            return AuthScreen();
          }),
    );
  }
}
