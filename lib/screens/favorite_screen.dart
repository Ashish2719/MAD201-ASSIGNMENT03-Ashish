import 'package:flutter/material.dart';
import '../models/movie.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Movie> favoriteMovies;
  final Function(Movie) onRemoveFavorite;

  const FavoriteScreen({
    required this.favoriteMovies,
    required this.onRemoveFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteMovies.length,
      itemBuilder: (context, index) {
        final movie = favoriteMovies[index];
        return ListTile(
          leading: Image.asset(movie.imagePath, width: 50),
          title: Text(movie.title),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onRemoveFavorite(movie),
          ),
        );
      },
    );
  }
}
