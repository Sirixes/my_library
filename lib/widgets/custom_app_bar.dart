import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.yellow,
        child: Center(
            child: InkWell(
            onTap: () => print('ciao'),
            child: const Icon(Icons.book),
        ))
        
        );
  }
}
