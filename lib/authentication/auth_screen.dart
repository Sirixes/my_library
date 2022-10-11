import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_library/authentication/auth_form.dart';
import 'package:my_library/global_variables.dart';
import 'package:my_library/providers/book.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  //Function to log in the user or register the user
  void _submitAuthForm(
      String email, String username, String password, bool isLogin) async {
    UserCredential userCredential;
    //Try catch used to check if the credentials are valid
    try {
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        name = username;
        
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'email': email,
          'password': password,
          'reading': [],
          'wouldRead': [],
          'read': [],
          
        });
      }
    } on PlatformException catch (e) {
      String errorMessage = 'An error occurred, please check your credentials';
      if (e.message != null) {
        errorMessage = e.message!;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Theme.of(context).errorColor,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthForm(_submitAuthForm));
  }
}
