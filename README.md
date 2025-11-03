# MAD201 Assignment 3 - Movie Explorer App

**Course:** MAD201 Cross Platform Mobile Application  
**Lab:** Assignment 3  
**Developer:** Ashishkumar Prajapati, A00194842

## Project Overview

Movie Explorer App is a multi-page Flutter application that allows users to browse a list of movies, view detailed information, mark favorite movies, and navigate between sections using a Bottom Navigation Bar and Navigation Drawer.  
The app demonstrates dynamic lists, navigation, app structure, and key Flutter skills.

## Features

- **Home Screen:**  
  Displays a scrollable list of movies with poster image, title, genre/year, and a favorite icon (heart/star). Tapping a movie opens its detail screen.

- **Detail Screen:**  
  Shows large poster, title, release year, genre, and description. Users can toggle favorite status.

- **Favorites Screen:**  
  Lists only the movies the user has marked as favorite. Allows removal from favorites.

- **Profile Screen:**  
  Displays static user information: Name, email, avatar, and short bio.

- **Bottom Navigation Bar:**  
  Lets users switch between Home, Favorites, and Profile tabs seamlessly.

- **Navigation Drawer:**  
  Accessible from any screen, provides links to Home, About, and Contact Us (opens static info pages).

## Data Model

Movies are defined using a custom model class in `lib/models/movie.dart`:

