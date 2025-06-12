import 'package:projeto_c214/models/movie_model.dart';

class MovieService {
  // Lista local de filmes
  final List<Movie> movies = movies;

  Future<Movie> getMovie({int? index, List<Movie>? newMovies}) async {
    final selectedMovies = newMovies ?? movies;
    await Future.delayed(const Duration(seconds: 1)); // Simula delay de rede
    return selectedMovies[index ?? 0];
  }
}
