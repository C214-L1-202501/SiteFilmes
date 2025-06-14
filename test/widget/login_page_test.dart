import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/pages/login_page.dart';

void main() {
  testWidgets('Campos e botão da tela de login aparecem corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.widgetWithText(TextFormField, 'E-mail'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Senha'), findsOneWidget);

    expect(find.text('Entrar'), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
  });

  testWidgets('Login com e-mail e senha válidos', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.enterText(find.byKey(const Key('email')), 'admin@email.com');
    await tester.enterText(find.byKey(const Key('password')), '123456');

    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle(); // Aguarda navegação

    // Verifica se a nova tela foi exibida após login
    expect(find.text('Análise de Filmes'), findsOneWidget);
  });
}
