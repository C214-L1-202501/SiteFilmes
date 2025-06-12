import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/main.dart';
import 'package:projeto_c214/widgets/movie_card.dart';

void main() {
  testWidgets('Renderiza 16 MovieCards', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MovieCard), findsNWidgets(16));
  });

  testWidgets('Exibe Snackbar com texto digitado na busca', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    const testSearchText = 'Matrix';
    await tester.enterText(find.byType(TextField), testSearchText);
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    expect(find.text('Foi digitado $testSearchText na barra de pesquisa'), findsOneWidget);
  });
}
