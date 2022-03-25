class Book {
  final String title;
  final String author;
  final String publisher;
  final String thumbnailUrl;
  final String description;

  Book(
      {required this.title,
      required this.author,
      required this.publisher,
      required this.thumbnailUrl,
      required this.description});
}






























/*
class Book {
  final List<Item> items;

  Book({required this.items});

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    //Prendi items dalle api
    var list = parsedJson['items'] as List;
    //Buttale in una lista
    List<Item> itemList = list.map((i) => Item.fromJson(i)).toList();
    return Book(
      items: itemList,
    );
  }
}

class Item {
  final VolumeInfo volumeinfo;

  Item({required this.volumeinfo});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(volumeinfo: VolumeInfo.fromJson(parsedJson['volumeInfo']));
  }
}

class VolumeInfo {
  final String title;

  final String publisher;


  VolumeInfo(
      {required this.title, required this.publisher});

  factory VolumeInfo.fromJson(Map<String, dynamic> parsedJson) {
    return VolumeInfo(
      title: parsedJson['title'],
      publisher: parsedJson['publisher'],
    );
  }
}*/
