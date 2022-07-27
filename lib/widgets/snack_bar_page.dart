import 'package:flutter/material.dart';
import 'package:my_library/global_variables.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(name),
      action: SnackBarAction(
        label: 'Logout',
        onPressed: () {
          // Some code to Logout the user
        },
      ),
    );
  }
}
