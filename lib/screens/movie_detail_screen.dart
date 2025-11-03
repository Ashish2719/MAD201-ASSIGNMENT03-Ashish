import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final Function(bool) onFavoriteChanged;

  const MovieDetailScreen({
    required this.movie,
    required this.onFavoriteChanged,
    super.key,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.movie.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.movie.imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${widget.movie.title} (${widget.movie.year})",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.movie.genre),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.movie.description),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
                size: 30,
              ),
              onPressed: () {
                setState(() => isFavorite = !isFavorite);
                widget.onFavoriteChanged(isFavorite);
              },
            ),
          ],
        ),
      ),
    );
  }
}
