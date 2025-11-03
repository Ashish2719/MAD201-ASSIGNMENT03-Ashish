/// MAD201 Assignment 3
/// Ashish Prajapati, A00194842
/// Main entry point for Movie Explorer App
library;

import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'screens/home_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/movie_detail_screen.dart';

void main() => runApp(const MovieExplorerApp());

class MovieExplorerApp extends StatefulWidget {
  const MovieExplorerApp({super.key});

  @override
  State<MovieExplorerApp> createState() => _MovieExplorerAppState();
}

class _MovieExplorerAppState extends State<MovieExplorerApp> {
  int _selectedIndex = 0;

  // List of movies for the app
  final List<Movie> movies = [
    Movie(
      title: "Interstellar",
      genre: "Sci-Fi",
      year: 2014,
      description:
          "A team travels through a wormhole in space in an attempt to ensure humanity's survival.",
      imagePath: "assets/interstellar.jpg",
    ),
    Movie(
      title: "Inception",
      genre: "Action",
      year: 2010,
      description:
          "A thief steals corporate secrets through dream-sharing technology.",
      imagePath: "assets/inception.jpg",
    ),
    Movie(
      title: "The Dark Knight",
      genre: "Action",
      year: 2008,
      description:
          "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into chaos.",
      imagePath: "assets/dark_knight.jpg",
    ),
    Movie(
      title: "Arrival",
      genre: "Sci-Fi",
      year: 2016,
      description:
          "A linguist is recruited to communicate with alien visitors after mysterious spacecrafts land on Earth.",
      imagePath: "assets/arrival.jpg",
    ),
    Movie(
      title: "Coco",
      genre: "Animation",
      year: 2017,
      description:
          "Young Miguel seeks his family's history in the Land of the Dead during Dia de los Muertos.",
      imagePath: "assets/coco.jpg",
    ),
    Movie(
      title: "Parasite",
      genre: "Thriller",
      year: 2019,
      description:
          "An unemployed family becomes entangled in the life of a wealthy household.",
      imagePath: "assets/parasite.jpg",
    ),
  ];

  List<Movie> get favoriteMovies => movies.where((m) => m.isFavorite).toList();

  void _navigateToDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailScreen(
          movie: movie,
          onFavoriteChanged: (fav) {
            setState(() {
              movie.isFavorite = fav;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Movie Explorer')),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Movie Explorer',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("About"),
                      content: const Text(
                        "Movie Explorer App made for MAD201 Assignment 3.",
                      ),
                      actions: [
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Contact Us"),
                      content: const Text(
                        "Developer: Your Name\nEmail: your@email.com",
                      ),
                      actions: [
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        body: _selectedIndex == 0
            ? HomeScreen(movies: movies, onTap: _navigateToDetail)
            : _selectedIndex == 1
            ? FavoriteScreen(
                favoriteMovies: favoriteMovies,
                onRemoveFavorite: (movie) {
                  setState(() {
                    movie.isFavorite = false;
                  });
                },
              )
            : const ProfileScreen(),
      ),
    );
  }
}
