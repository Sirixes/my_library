import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:my_library/search/fetch_searched_book.dart';

/**
 * Lascio al momento così ma dovrà essere returnata la grid quindi la list sotto va cambiata
 * e collegata alla grid
 */

Widget SearchResultsListView({required searchTerm}) {

    if (searchTerm == '') {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Search a Book',
              //style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }
    log(searchTerm);
    return FetchSearchedBook(searchTerm);
  
    
  }

