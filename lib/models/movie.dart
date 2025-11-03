/// MAD201 Assignment 3
/// Your Name, Student ID
/// Movie model representing each movie in the app

class Movie {
  final String title;
  final String genre;
  final int year;
  final String description;
  final String imagePath;
  bool isFavorite;

  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  });
}
