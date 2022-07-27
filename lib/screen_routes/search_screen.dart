import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:my_library/widgets/floating_bar.dart';

//A schermo deve essere mostrata la lista dei libri puù ricercati con una barra di ricerca e il widget stile netflix

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: searchBar(context),);
  }
}
