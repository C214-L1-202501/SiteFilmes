import 'package:flutter/material.dart';
import 'package:projeto_c214/models/movie_model.dart';

class MovieCard extends StatefulWidget {
  final int movieIndex;

  const MovieCard({Key? key, required this.movieIndex}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  late Future<Movie> _movieFuture;

  @override
  void initState() {
    super.initState();
    // Aqui você deveria usar seu serviço para obter o filme
    _movieFuture = Future.value(movies[widget.movieIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: _movieFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Erro ao carregar o filme');
        }
        if (!snapshot.hasData) {
          return const Text('Filme não encontrado');
        }
        final movie = snapshot.data!;
        return Card(
          child: ListTile(
            title: Text(movie.name),
            subtitle: Text('Diretor: ${movie.director}'),
          ),
        );
      },
    );
  }
}
