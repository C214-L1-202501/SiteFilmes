import 'package:flutter/material.dart';
import 'package:projeto_c214/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Duração: ${movie.duration} minutos', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Diretor: ${movie.director}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Elenco:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...movie.cast.map((actor) => Text(actor, style: const TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
