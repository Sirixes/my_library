import 'dart:ffi';

import 'package:flutter/material.dart';

//Class used to create the AuthForm widget
class AuthForm extends StatefulWidget {
  final void Function(
          String email, String username, String password, bool isLogin)
      submitFunction;

  AuthForm(this.submitFunction);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  //To see if we are in login or register mode

  bool _isLogin = true;
  String _email = '';
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            //In modo che la colonna non utilizza tutto lo spazio possibile
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Insert your email address',
                    ),
                    //Se lo stato viene salavto allora memorizzo quello che c'è in quel campo
                    //Lo stato viene salvato quando gli input sono validi
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  //To add the following widget dynamically
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please insert Username!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Insert your email Username',
                      ),
                      onSaved: (value) {
                        _username = value!;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Password must be at least 8 characters!';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Insert a Password',
                    ),
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    child: Text(_isLogin ? 'Log in' : 'Signup'),
                    onPressed: _trySubmit,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new account'
                          : "I already have an account")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _trySubmit() {
    final _isValid = _formKey.currentState!.validate();
    //Used to close keyboard when submit button is pressed
    FocusScope.of(context).unfocus();
    if (_isValid) {
      _formKey.currentState?.save();
      widget.submitFunction(_email.trim(), _username.trim(), _password.trim(), _isLogin);
    }
  }
}
