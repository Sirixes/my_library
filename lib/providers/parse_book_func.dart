import 'dart:convert';
import 'package:my_library/providers/book.dart';

List<Book> parseBookJson(String jsonStr) {
  final jsonMap = json.decode(jsonStr);
  final jsonList = (jsonMap['items'] as List);
  //For each element took from the jason file we see if is null because this
  //can give an error in execution
  return jsonList
      .map((jsonBook) => Book(
            title: (jsonBook['volumeInfo']['title']) == null
                ? 'Not available'
                : jsonBook['volumeInfo']['title'],
            author: (jsonBook['volumeInfo']['authors']) == null
                ? 'not available'
                : ((jsonBook['volumeInfo']['authors'] as List).join(', ')),
            publisher: (jsonBook['volumeInfo']['publisher']) == null
                ? 'Publisher not avaiable'
                : jsonBook['volumeInfo']['publisher'],
            description: (jsonBook['volumeInfo']['description']) == null
                ? 'Not avaiable'
                : jsonBook['volumeInfo']['description'],
            thumbnailUrl:
                (jsonBook['volumeInfo']['imageLinks']) == null
                    ? 'Not avaiable'
                    : jsonBook['volumeInfo']['imageLinks']['smallThumbnail'],
                    
          ))
      .toList();
}