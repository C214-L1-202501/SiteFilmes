import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/main.dart';
import 'package:projeto_c214/widgets/movie_card.dart';

void main() {
  testWidgets('AppBar exibe o título correto', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Análise de Filmes'), findsOneWidget);
  });

  testWidgets('Renderiza exatamente 16 MovieCards na tela inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MovieCard), findsNWidgets(16));
  });

  testWidgets('Verifica se um dos filmes renderizados é "Matrix"', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Matrix'), findsOneWidget);
  });

  testWidgets('Verifica se ao menos outro título é exibido (Movie 2)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Movie 2'), findsOneWidget);
  });

  testWidgets('Abre o Drawer e verifica presença dos itens do menu', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    expect(find.text('Cadastro'), findsOneWidget);
    expect(find.text('Início'), findsOneWidget);
    expect(find.text('Filmes'), findsOneWidget);
    expect(find.text('Configurações'), findsOneWidget);
  });

  testWidgets('Exibe Snackbar com texto digitado ao pesquisar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'Matrix');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump(); // animação do SnackBar

    expect(find.text('Foi digitado Matrix na barra de pesquisa'), findsOneWidget);
  });
}
