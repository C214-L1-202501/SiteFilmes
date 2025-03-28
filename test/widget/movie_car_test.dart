import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_c214/models/movie_model.dart';
import 'package:projeto_c214/services/movie_service.dart';
import 'package:projeto_c214/widgets/movie_card.dart';

class MockMovieService extends Mock implements MovieService {}

void main() {
  setUpAll(() {
    registerFallbackValue(0);
  });

  testWidgets('MovieCard displays movie data when service returns a movie', (
    WidgetTester tester,
  ) async {
    final mockService = MockMovieService();

    final testMovie = Movie(
      duration: 120,
      name: "Test Movie",
      director: "Test Director",
      cast: ["Actor 1", "Actor 2"],
    );

    when(
      () => mockService.getMovie(index: any(named: 'index')),
    ).thenAnswer((_) async => testMovie);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: MovieCard(movieService: mockService, index: 0)),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text("Test Movie"), findsOneWidget);
    expect(find.text("Director: Test Director"), findsOneWidget);
    expect(find.text("Duration: 120 mins"), findsOneWidget);
    expect(find.text("Cast: Actor 1, Actor 2"), findsOneWidget);
  });
}
