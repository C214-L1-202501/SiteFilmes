import 'dart:math';

import 'package:projeto_c214/models/movie_model.dart';

class MovieService {
  Future<Movie> getMovie({int? index, List<Movie>? newMovies}) async {
    final selectedMovies = newMovies ?? movies;
    await Future.delayed(Duration(seconds: 1));
    final random = Random();
    final randomInt = random.nextInt(selectedMovies.length);
    return selectedMovies[index ?? randomInt];
  }
}
