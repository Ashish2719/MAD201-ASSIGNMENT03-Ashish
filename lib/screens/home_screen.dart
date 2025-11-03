import 'package:flutter/material.dart';
import '../models/movie.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onTap;

  const HomeScreen({required this.movies, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          leading: Image.asset(movie.imagePath, width: 50),
          title: Text(movie.title),
          subtitle: Text("${movie.genre} • ${movie.year}"),
          trailing: Icon(
            movie.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: movie.isFavorite ? Colors.red : null,
          ),
          onTap: () => onTap(movie),
        );
      },
    );
  }
}
