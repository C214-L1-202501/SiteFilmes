import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/widgets/movie_card.dart';
import 'package:projeto_c214/models/movie_model.dart';
import 'package:projeto_c214/services/movie_service.dart';

class FakeMovieService extends MovieService {
  @override
  Future<Movie> getMovie({int? index, List<Movie>? newMovies}) async {
    return Movie(
      name: 'Matrix',
      director: 'Wachowski',
      duration: 136,
      cast: ['Keanu Reeves', 'Laurence Fishburne'],
    );
  }
}

void main() {
  testWidgets('MovieCard mostra dados do filme sem mock externo', (WidgetTester tester) async {
    final fakeService = FakeMovieService();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieCard(movieService: fakeService, index: 0),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Matrix'), findsOneWidget);
    expect(find.text('Diretor: Wachowski'), findsOneWidget);
    expect(find.text('Duração: 136 min'), findsOneWidget);
    expect(find.textContaining('Keanu Reeves'), findsOneWidget);
  });
}
