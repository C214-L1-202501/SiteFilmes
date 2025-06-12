import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/main.dart';
import 'package:projeto_c214/pages/cadastro_page.dart';
import 'package:projeto_c214/widgets/movie_card.dart';

void main() {
  testWidgets('Verifica se o AppBar exibe o título correto', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(); // aguarda a renderização completa

    expect(find.text('Análise de Filmes'), findsOneWidget);
  });

  testWidgets('Verifica se 16 MovieCards são renderizados', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(); // necessário para widgets dinâmicos

    expect(find.byType(MovieCard), findsNWidgets(16));
  });

  testWidgets('Verifica os itens do Drawer', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Abrir o Drawer usando o botão de menu
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    expect(find.text('Início'), findsOneWidget);
    expect(find.text('Filmes'), findsOneWidget);
    expect(find.text('Configurações'), findsOneWidget);
    expect(find.text('Cadastro'), findsOneWidget);
  });

  testWidgets('Navega para CadastroPage ao clicar em Cadastro no Drawer', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Abrir o Drawer
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    // Tocar no item 'Cadastro'
    await tester.tap(find.text('Cadastro'));
    await tester.pumpAndSettle();

    // Verifica se a tela de Cadastro foi aberta
    expect(find.byType(CadastroPage), findsOneWidget);
  });

  testWidgets('Exibe Snackbar ao fazer uma busca', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Digitar na barra de busca
    await tester.enterText(find.byType(TextField), 'Matrix');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump(); // necessário para exibir o snackbar

    expect(find.text('Foi digitado Matrix na barra de pesquisa'), findsOneWidget);
  });
}
