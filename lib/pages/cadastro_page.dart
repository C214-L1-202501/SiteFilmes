import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _cadastrar() {
    final nome = _nomeController.text;
    final dataNascimento = _dataNascimentoController.text;
    final login = _loginController.text;
    final senha = _senhaController.text;

    // Exemplo: só mostra um alerta com os dados para testar
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cadastro'),
        content: Text('Nome: $nome\nData Nasc.: $dataNascimento\nLogin: $login\nSenha: $senha'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );

    // Aqui você pode adicionar validação, enviar para backend, etc.
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dataNascimentoController.dispose();
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _dataNascimentoController,
              decoration: const InputDecoration(labelText: 'Data de Nascimento'),
            ),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
