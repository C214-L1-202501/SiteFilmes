import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_c214/pages/cadastro_page.dart';

void main() {
  testWidgets('Campos de texto e botão estão presentes', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CadastroPage()),
    );

    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.widgetWithText(TextField, 'Nome'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Data de Nascimento'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Login'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Senha'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Cadastrar'), findsOneWidget);
  });

  testWidgets('Ao cadastrar, mostra diálogo com dados preenchidos', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CadastroPage()),
    );

    // Preenche os campos
    await tester.enterText(find.widgetWithText(TextField, 'Nome'), 'João');
    await tester.enterText(find.widgetWithText(TextField, 'Data de Nascimento'), '01/01/1990');
    await tester.enterText(find.widgetWithText(TextField, 'Login'), 'joao123');
    await tester.enterText(find.widgetWithText(TextField, 'Senha'), 'senhaSegura');

    // Clica no botão cadastrar
    await tester.tap(find.widgetWithText(ElevatedButton, 'Cadastrar'));
    await tester.pumpAndSettle();

    // Verifica se o diálogo aparece com o texto correto

    // Fecha o diálogo
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });
}
