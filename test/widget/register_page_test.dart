import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/pages/register_page.dart';

void main() {
  testWidgets('Campos e botão da tela de cadastro aparecem corretamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

    expect(find.widgetWithText(TextFormField, 'E-mail'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Senha'), findsOneWidget);
    expect(find.text('Cadastrar'), findsOneWidget);
  });

  testWidgets('Cadastro com e-mail e senha válidos', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

    await tester.enterText(find.byKey(const Key('email')), 'novo@email.com');
    await tester.enterText(find.byKey(const Key('password')), 'senha123');

    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle(); // Aguarda retorno à tela de login

    // Após cadastro, o usuário é redirecionado para a tela de login
    expect(find.text('Entrar'), findsOneWidget);
  });
}
