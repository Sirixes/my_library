import 'dart:async';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_library/providers/search_engine.dart';
import 'package:my_library/search/fetch_searched_book.dart';

/**
 * 
 * 
 * DA RIFARE COMPLETAMENTE SEGUENDO LA GUIDA SUL QUESTO SITO: https://resocoder.com/2021/01/23/search-bar-in-flutter-logic-material-ui/
 * 
 */
FloatingSearchBar searchBar(dynamic context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  FloatingSearchBarController controller = FloatingSearchBarController();
  return FloatingSearchBar(
    controller: controller,
    hint: 'Search a title...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onSubmitted: (query) {
      FetchSearchedBook(query);
      controller.close;

    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.mic),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Colors.accents.map((color) {
              return Container(height: 112, color: color);
            }).toList(),
          ),
        ),
      );
    },
  );
}
