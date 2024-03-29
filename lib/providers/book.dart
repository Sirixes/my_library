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

  Map toJson() {
    return {
      'title': title,
      'author': author,
      'publisher': publisher,
      'thumbnailUrl': thumbnailUrl,
      'description': description,
    };
  }
}
