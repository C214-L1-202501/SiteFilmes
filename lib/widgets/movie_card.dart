import 'package:flutter/material.dart';
import 'package:projeto_c214/models/movie_model.dart';
import 'package:projeto_c214/services/movie_service.dart';
import 'package:projeto_c214/pages/movie_detail_page.dart';


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
              child: Text("Erro: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          final movie = snapshot.data!;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text("Diretor: ${movie.director}"),
                    const SizedBox(height: 8),
                    Text("Duração: ${movie.duration} min"),
                    const SizedBox(height: 8),
                    Text("Elenco: ${movie.cast.join(', ')}"),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
