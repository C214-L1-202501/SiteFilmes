import 'package:flutter/material.dart';
import 'package:projeto_c214/models/movie_model.dart';
import 'package:projeto_c214/services/movie_service.dart';

class MovieCard extends StatefulWidget {
  final MovieService? movieService;
  final int? index;

  const MovieCard({super.key, this.movieService, this.index});

  @override
  MovieCardState createState() => MovieCardState();
}

class MovieCardState extends State<MovieCard> {
  late Future<Movie> _movieFuture;

  @override
  void initState() {
    super.initState();
    final movieService = widget.movieService ?? MovieService();
    _movieFuture = movieService.getMovie(index: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: _movieFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          final movie = snapshot.data!;
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Director: ${movie.director}"),
                  SizedBox(height: 8),
                  Text("Duration: ${movie.duration} mins"),
                  SizedBox(height: 8),
                  Text("Cast: ${movie.cast.join(', ')}"),
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
